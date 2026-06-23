source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '4.0.5'

# Gem to generate random data (used at runtime by lib/generator.rb)
gem 'faker', '~> 3.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'
# Use Puma as the app server
gem 'puma', '~> 6.4'
# Use ActiveModel has_secure_password & JWT Tokens
gem 'bcrypt', '~> 3.1'
gem 'jwt', '~> 2.9'
# JSON serialization (replaces active_model_serializers)
gem 'blueprinter', '~> 1.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.18', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
gem 'rack-cors', '~> 2.0'

# Rate limiting
gem 'rack-attack', '~> 6.7'

group :development, :test do
  # Debugger console
  gem 'debug', '>= 1.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.8'
  gem 'sqlite3', '~> 2.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
