class SelfEvaluation < ApplicationRecord
  belongs_to :job_application
  has_many :technology_self_evaluations
  has_many :technologies, through: :technology_self_evaluations
end
