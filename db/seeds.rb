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

company = Company.create! name: 'Example Inc.'
role_description = RoleDescription.create! name: 'Full stack software enginer', company: company, skills: skills.values

interviewee = Interviewee.create! name: 'John Doe', email: 'john.doe@example.com'
job_application = JobApplication.create! role_description: role_description, interviewee: interviewee
self_evaluation = SelfEvaluation.create! job_application: job_application
