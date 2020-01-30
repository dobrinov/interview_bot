module SkillSelfEvaluationLevel
  extend self

  def all
    {
      no_experience: {
        label: 'No experience',
        description: '?'
      },
      beginner: {
        label: 'Beginner',
        description: '?'
      },
      intermediate: {
        label: 'Intermediate',
        description: '?'
      },
      advanced: {
        label: 'Advanced',
        description: '?'
      },
      expert: {
        label: 'Expert',
        description: '?'
      },
    }
  end

  def options_for_select
    all.map { |k, v| [v[:label], k] }
  end
end
