class SelfEvaluationReview
  #def initialize(self_evaluation: self_evaluation)
  #  @self_evaluation = self_evaluation
  #end

  #def role_technology_self_evaluations
  #  role_technologies = @self_evaluation.job_application.role_description.technologies
  #  @self_evaluation.technology_self_evaluations.where technology: role_technologies
  #end

  #def additional_technology_self_evaluations
  #  additional_technologies =
  #    @self_evaluation.
  #      technologies.
  #      joins('LEFT JOIN role_descriptions_technologies ON role_descriptions_technologies.technology_id = technologies.id').
  #      where('role_descriptions_technologies.technology_id IS NULL')

  #  @self_evaluation.technology_self_evaluations.where technology: additional_technologies
  #end
end
