source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'dotenv'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'haml'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Zeus and guard testing from: http://www.ksylvest.com/posts/2012-03-09/faster-testing-in-rails-with-guard-for-zeus-rspec-and-cucumber
group :development do
  gem "zeus"
  gem "guard"
  gem "guard-bundler"
  #gem "guard-cucumber"
  gem "guard-rspec"
  gem "guard-migrate"
  #gem "guard-zeus"
  gem "rb-inotify", require: false
  gem "rb-fsevent", require: false
  gem "rb-fchange", require: false
end

group :test do
  gem "rspec-rails"
  #gem "cucumber-rails"
  gem 'simplecov', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

# Needed to use my own fork so I could bump the version of multi-json and hashie
#gem 'desk', :git => 'https://github.com/fotioslindiakos/desk.git'
#gem 'desk', :path => '/home/fotios/projects/forks/desk'
gem 'omniauth-desk'#, :git => 'https://github.com/fotioslindiakos/omniauth-desk.git'
gem 'simple_oauth'
gem 'haml'
gem 'haml-rails'
gem 'foundation-rails'

gem 'faraday'
gem 'faraday_middleware'
gem 'faraday-http-cache'

# Add this for Heroku
gem 'rails_12factor', group: :production

ruby "2.0.0"
