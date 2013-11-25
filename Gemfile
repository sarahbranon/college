source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'

# ASSETS
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.0.0.0'

# AUTH
gem 'cancan'
gem 'rolify'
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'koala'

# CONFIG
gem 'figaro'

# TEMPLATES
gem 'haml-rails'
gem 'simple_form'

# DB
gem 'pg'

# DEVELOPMENT
group :development do
  # Debug
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'pry-rails'

  # Misc
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
end

# TEST!
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

# "PRODUCTION"
group :production do
  gem 'unicorn'
end
