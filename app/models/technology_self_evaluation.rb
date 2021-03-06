class TechnologySelfEvaluation < ApplicationRecord
  belongs_to :technology
  belongs_to :self_evaluation

  validates :level, :number_of_projects, :total_experience, presence: true, if: :submitted_at?

  delegate :submitted_at, :submitted_at?, to: :self_evaluation
end
