class SelfEvaluationPreview
  Level =
    Struct.new :id,
               :label,
               :role_technology_self_evaluations,
               :additional_technology_self_evaluations

  Technology = Struct.new :id, :name, :kind

  TechnologySelfEvaluation =
    Struct.new :technology_name,
               :level,
               :number_of_projects,
               :total_experience

  def initialize(self_evaluation)
    @self_evaluation = self_evaluation
  end

  def company_name
    @self_evaluation.job_application.role_description.company.name
  end

  def role_name
    @self_evaluation.job_application.role_description.name
  end

  def interviewee_name
    @self_evaluation.job_application.interviewee.name
  end

  def levels
    level_options.map do |level|
      level_label, level_id = level
      Level.new(level_id, level_label, technology_self_evaluations[:role][level_id], technology_self_evaluations[:additional][level_id])
    end
  end

  def level_options
    [
      ['Expert', 'expert'],
      ['Advanced', 'advanced'],
      ['Beginner', 'beginner'],
      ['Theoretical', 'theoretical'],
      ['No experience', 'no experience'],
    ]
  end

  def technology_self_evaluations
    return @computed_technology_self_evaluations if @computed_technology_self_evaluations.present?

    empty_technology_evaluation_set =
      level_options.inject({}) do |acc, level|
        _, id = level
        acc[id] = []
        acc
      end

    @computed_technology_self_evaluations =
      {
        role: empty_technology_evaluation_set.deep_dup,
        additional: empty_technology_evaluation_set.deep_dup,
      }

    role_technologies =
      @self_evaluation.
        job_application.
        role_description.
        technologies

    additional_technologies =
      @self_evaluation.
        technologies.
        joins('LEFT JOIN role_descriptions_technologies ON role_descriptions_technologies.technology_id = technologies.id').
        where('role_descriptions_technologies.technology_id IS NULL')

    technologies = {}

    role_technologies.each do |technology|
      technologies[technology.id] = Technology.new technology.id, technology.name, :role
    end

    additional_technologies.each do |technology|
      technologies[technology.id] = Technology.new technology.id, technology.name, :additional
    end

    technology_self_evaluations =
      @self_evaluation.technology_self_evaluations.where technology_id: technologies.keys

    technology_self_evaluations.each do |technology_self_evaluation|
      technology = technologies[technology_self_evaluation.technology_id]

      @computed_technology_self_evaluations[technology.kind][technology_self_evaluation.level] <<
        TechnologySelfEvaluation.new(technology.name,
                                     technology_self_evaluation.level,
                                     "#{technology_self_evaluation.number_of_projects} projects",
                                     technology_self_evaluation.total_experience)
    end

    @computed_technology_self_evaluations
  end
end
