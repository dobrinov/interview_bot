technologies = Technology.
           create!([
                     'Ruby',
                     'C',
                     'C++',
                     'Go',
                     'Rust',
                     'PHP',
                     'Scala',
                     'Clojure',
                     'Erlang',
                     'Elixir',
                     'Java',
                     'JavaScript',
                     'TypeScript',
                     'Ruby on Rails',
                     'HTML',
                     'CSS',
                     'React',
                     'Vue.js',
                     'PostgreSQL',
                     'MySQL',
                     'MongoDB',
                     'Cassandra',
                     'Redis',
                     'Git'
                   ].map { |technology| {name: technology} }).
           map { |technology| [technology.name.parameterize(separator: '_').to_sym, technology] }.
           to_h

company = Company.create! name: 'Example Inc'
role_description = RoleDescription.create! name: 'Full stack software engineer', company: company, technologies: technologies.slice(:ruby, :css, :html, :postgresql).values

interviewee = Interviewee.create! name: 'John Doe', email: 'john.doe@example.com'
job_application = JobApplication.create! role_description: role_description, interviewee: interviewee
self_evaluation = SelfEvaluation.create! job_application: job_application, slug: SecureRandom.hex
