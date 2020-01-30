class SelfEvaluationSubmission
  include ActiveAttr::Model

  attribute :self_evaluation

  delegate :id, to: :self_evaluation

  def skill_self_evaluations
    @skill_self_evaluations ||= self_evaluation.skill_self_evaluations.includes :skill
  end

  def skill_self_evaluations_attributes=(attributes)
    raise attributes.inspect
  end

  def submit(params)
    #params[:skill_self_evaluations_attributes].each do |_, skill_evaluation_params|
    #  skill_self_evaluations.
    #    update level: skill_evaluation_params[:level].presence,
    #           number_of_projects: skill_evaluation_params[:number_of_projects],
    #           months_of_experience: skill_evaluation_params[:months_of_experience]
    #end
    raise params.inspect

    self_evaluation.submitted_at = Time.current

    skill_self_evaluations.map(&:valid?).all? && self_evaluation.save
  end
end
