source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "annotate"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "cancancan"
gem "cocoon"
gem "devise"
gem "hamlit"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "rails-i18n"
gem "redis", "~> 4.0"
gem "simple_form"
gem "stimulus-rails"
gem "sprockets-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'vanilla_nested', github: 'arielj/vanilla-nested', branch: :main


group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry"
  gem "pry-doc"
end

group :development do
  gem "hamlit-rails"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
