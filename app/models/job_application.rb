class JobApplication < ApplicationRecord
  belongs_to :role_description
  belongs_to :interviewee
  has_one :self_evaluation
end
