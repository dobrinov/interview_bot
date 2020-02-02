class SelfEvaluation < ApplicationRecord
  belongs_to :job_application
  has_many :skill_self_evaluations
  has_many :skills, through: :skill_self_evaluations
end
