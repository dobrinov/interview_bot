class RoleDescription < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :technologies
  has_many :job_applications, dependent: :destroy
end
