require 'rails_helper'

# describe SelfEvaluationReview do
#   it 'selects different technology categories' do
#     role_technology = create :technology, name: 'Role technology'
#     additional_technology = create :technology, name: 'Additional technology'
#     role_description = create :role_description, technologys: [role_technology]
#     job_application = create :job_application, role_description: role_description
#     self_evaluation = create :self_evaluation, job_application: job_application
#     create :technology_self_evaluation, self_evaluation: self_evaluation, technology: role_technology
#     create :technology_self_evaluation, self_evaluation: self_evaluation, technology: additional_technology
# 
#     self_evaluation.role_technologys.should eq [role_technology]
#     self_evaluation.additional_technologys.should eq [additional_technology]
#   end
# end
