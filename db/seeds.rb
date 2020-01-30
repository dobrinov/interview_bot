skills = Skill.
           create!([
                     'Ruby',
                     'Ruby on Rails',
                     'HTML',
                     'CSS',
                     'JavaScript',
                     'TypeScript',
                     'React',
                     'PostgreSQL',
                   ].map { |skill| {name: skill, standartized: true} }).
           map { |skill| [skill.name.parameterize(separator: '_').to_sym, skill] }.
           to_h

company = Company.create! name: 'Example Inc.', skills: skills.values
interviewee = Interviewee.create! name: 'John Doe', email: 'john.doe@example.com'

self_evaluation = SelfEvaluation.create! interviewee: interviewee

SkillSelfEvaluation.create! skill: skills[:postgresql], self_evaluation: self_evaluation
SkillSelfEvaluation.create! skill: skills[:ruby_on_rails], self_evaluation: self_evaluation
SkillSelfEvaluation.create! skill: skills[:ruby], self_evaluation: self_evaluation
