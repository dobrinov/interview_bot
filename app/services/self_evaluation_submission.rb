class SelfEvaluationSubmission
  include ActiveAttr::Model

  attribute :self_evaluation

  delegate :id, :skill_self_evaluations, to: :self_evaluation

  def company
    role_description.company
  end

  def role_description
    self_evaluation.job_application.role_description
  end

  def role_skill_self_evaluations
    @role_skill_self_evaluations ||=
      skill_self_evaluations.select { |evaluation| evaluation.category == 'required_by_role' }
  end

  def additional_skill_self_evaluations
    @additional_skill_self_evaluations ||=
      skill_self_evaluations.select { |evaluation| evaluation.category == 'additional' }
  end

  def role_skill_self_evaluations_attributes=(attributes)
    return if attributes.blank?

    attributes.each do |_, skill_evaluation_attributes|
      skill_self_evaluations.build skill_evaluation_attributes.merge category: 'required_by_role'
    end
  end

  def additional_skill_self_evaluations_attributes=(attributes)
    return if attributes.blank?

    attributes.each do |_, skill_evaluation_attributes|
      next if skill_evaluation_attributes.values.all?(&:blank?)

      skill_self_evaluations.build skill_evaluation_attributes.merge(category: 'additional')
    end
  end

  def add_blank_additional_skill_self_evaluation
    skill_self_evaluations.build category: 'additional'
  end

  def add_role_description_skill_self_evaluations
    @role_skill_self_evaluations =
      role_description.skills.map do |skill|
        skill_self_evaluations.build skill: skill, category: 'required_by_role'
      end
  end

  def valid?
    skill_self_evaluations.map(&:valid?).all? && self_evaluation.valid?
  end

  def submit(params)
    self.role_skill_self_evaluations_attributes = params[:role_skill_self_evaluations_attributes]
    self.additional_skill_self_evaluations_attributes = params[:additional_skill_self_evaluations_attributes]

    self_evaluation.submitted_at = Time.current
    valid? && self_evaluation.save
  end
end
