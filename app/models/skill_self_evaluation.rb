class SkillSelfEvaluation < ApplicationRecord
  belongs_to :skill
  belongs_to :self_evaluation

  validates :level, :number_of_projects, :months_of_experience, presence: true, if: :submitted_at?

  delegate :submitted_at, :submitted_at?, to: :self_evaluation
end
