require 'rails_helper'

describe SelfEvaluationSubmission do
  around do |example|
    Timecop.freeze { example.run }
  end

  it 'submits a self evaluation' do
    self_evaluation = create :self_evaluation
    ruby = create :skill, name: 'Ruby'
    rails = create :skill, name: 'Ruby on Rails'
    postgresql = create :skill, name: 'PostgreSQL'

    submission = SelfEvaluationSubmission.new self_evaluation: self_evaluation

    form_data =
      {
        role_skill_self_evaluations_attributes: {
          0 => {
            skill_id: ruby.id, level: '10', number_of_projects: '10+', total_experience: '5+ years'
          },
          1 => {
            skill_id: rails.id, level: '10', number_of_projects: '10+', total_experience: '5+ years'
          },
        },
        additional_skill_self_evaluations_attributes: {
          0 => {
            skill_id: postgresql.id, level: '10', number_of_projects: '10+', total_experience: '5+ years'
          }
        }
      }

    submission.submit form_data

    self_evaluation.reload
    self_evaluation.submitted_at.should eq Time.current
    self_evaluation.skill_self_evaluations.count.should eq 3
  end

  describe 'validation' do
    it 'is invalid if there are skill duplications' do
      self_evaluation = create :self_evaluation
      ruby = create :skill, name: 'Ruby'

      submission = SelfEvaluationSubmission.new self_evaluation: self_evaluation

      form_data =
        {
          role_skill_self_evaluations_attributes: {
            0 => { skill_id: ruby.id },
          },
        }

      submission.submit form_data

      submission.should_not be_valid
      submission.self_evaluation.errors.should be_empty
      submission.
        skill_self_evaluations.
        map(&:errors).
        map(&:messages).
        should =~ [
                    {
                      level: ["can't be blank"],
                      number_of_projects: ["can't be blank"],
                      total_experience: ["can't be blank"]
                    }
                  ]
    end
  end
end
