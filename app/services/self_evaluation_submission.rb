class SelfEvaluationSubmission
  include ActiveAttr::Model

  attribute :self_evaluation

  delegate :slug, to: :self_evaluation

  class << self
    def for(self_evaluation)
      submission = new(self_evaluation: self_evaluation)

      submission.role_description.technologies.each do |technology|
        submission.self_evaluation.technology_self_evaluations.build technology: technology
      end

      submission.self_evaluation.technology_self_evaluations.build

      submission
    end
  end

  def company
    role_description.company
  end

  def role_description
    self_evaluation.job_application.role_description
  end

  def role_technology_ids
    @role_technology_ids ||= role_description.technologies.pluck(:id)
  end

  def role_technology_self_evaluations
    @role_technology_self_evaluations ||=
      self_evaluation.
        technology_self_evaluations.
        select { |technology_self_evaluation| technology_self_evaluation.technology_id.in? role_technology_ids }
  end

  def additional_technology_self_evaluations
    @additional_technology_self_evaluations ||= self_evaluation.technology_self_evaluations - role_technology_self_evaluations
  end

  def role_technology_self_evaluations_attributes=(attributes)
    return if attributes.empty?

    attributes.each do |technology_evaluation_attributes|
      self_evaluation.technology_self_evaluations.build technology_evaluation_attributes
    end
  end

  def additional_technology_self_evaluations_attributes=(attributes)
    return if attributes.empty?

    attributes.each do |technology_evaluation_attributes|
      next if technology_evaluation_attributes.values.all?(&:blank?)

      self_evaluation.technology_self_evaluations.build technology_evaluation_attributes
    end.compact
  end

  def valid?
    [
      self_evaluation.technology_self_evaluations.map(&:valid?).all?,
      self_evaluation.valid?
    ].all?
  end

  def submit(params)
    role_technology_self_evaluations_attributes = params[:role_technology_self_evaluations_attributes].values
    additional_technology_self_evaluations_attributes =
      params[:additional_technology_self_evaluations_attributes].
        values.
        reject { |attributes| attributes.values.all?(&:blank?) || attributes[:technology_id].to_i.in?(role_technology_ids) }.
        uniq { |attributes| attributes[:technology_id] }

    self.role_technology_self_evaluations_attributes = role_technology_self_evaluations_attributes
    self.additional_technology_self_evaluations_attributes = additional_technology_self_evaluations_attributes

    self_evaluation.submitted_at = Time.current

    if valid?
      self_evaluation.save
    else
      self_evaluation.technology_self_evaluations.build
      false
    end
  end
end
