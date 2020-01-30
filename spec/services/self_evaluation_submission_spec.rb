require 'rails_helper'

describe SelfEvaluationSubmission do
  around do |example|
    Timecop.freeze { example.run }
  end

  it 'submits a self evaluation' do
    self_evaluation = create :self_evaluation
    ruby = create :skill, name: 'Ruby'
    rails = create :skill, name: 'Ruby on Rails'

    submission = SelfEvaluationSubmission.new self_evaluation: self_evaluation

    submission.submit [
                        {skill: rails, level: 'advanced', number_of_projects: 1, months_of_experience: 12},
                        {skill: ruby,  level: 'expert',   number_of_projects: 2, months_of_experience: 24},
                      ]

    self_evaluation.submitted_at.should eq Time.current
    self_evaluation.skill_self_evaluations.count.should eq 2
  end

  describe 'validation' do
    it 'is invalid if there are skill duplications'
  end
end
