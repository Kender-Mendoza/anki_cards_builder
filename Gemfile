source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
# gem 'dartsass-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'nokogiri'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.6'
gem 'redis', '~> 4.0'
gem 'rest-client'
gem 'sorbet-runtime'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'tapioca'
end

group :development do
  gem 'sorbet'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
