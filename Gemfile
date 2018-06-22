source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.7"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "byebug", platform: :mri
  gem "mysql2", ">= 0.3.18", "< 0.6.0"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 3.1"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
  gem "fog", "1.42"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "rubocop", "~> 0.35.1", require: false
gem "faker", "1.8.7"
gem "bcrypt"
gem "bootstrap-sass", "~> 3.3.7"
gem "config"
gem "will_paginate", "~> 3.1.0"
gem "bootstrap-will_paginate", "1.0.0"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"
gem "devise"
gem "cancancan", "~> 2.0"
gem "ransack"
