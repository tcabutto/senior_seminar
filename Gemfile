source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
#gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'validates_timeliness', '~> 4.0'
gem 'bootstrap-sass'
gem 'webpacker'
gem 'webpacker-react', "~> 0.3.2"
gem 'jquery-rails'
#image uploads to AWS S3
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
#accounts
gem 'devise'
#better forms
gem 'simple_form'
#authentication
gem 'pundit'
#administrators


#qr code generator 
gem 'rqrcode'

#For superaccount
gem 'bourbon'
gem 'rails_admin'
#sendgrid encryption
gem 'figaro'
#stats page
gem 'chartkick'
gem 'hightop'
gem 'groupdate' #group by day, week, etc.
gem 'ahoy_matey' #analytics
gem 'blazer'
#pagination
gem 'kaminari'
#fake form fill
gem 'faker'
#favorites system
gem 'acts_as_votable', '~> 0.10.0'
#Google maps
gem 'geocoder'
gem 'gmaps4rails'
#underscorejs gem. Needed for maps gem
gem 'underscore-rails'

gem 'profanity_filter'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
end

group :production do
    gem 'pg', '0.18.4'
    gem 'rails_12factor', '0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]