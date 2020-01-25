source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'active_attr'
gem 'bootsnap', require: false
gem 'pg'
gem 'puma'
gem 'rails'
gem 'sass-rails'
gem 'slim-rails'
gem 'webpacker'

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'timecop'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
