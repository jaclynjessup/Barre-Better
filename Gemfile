source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.2.5'

gem 'pg', '~> 0.18'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'coveralls', require: false
end

gem 'devise'
gem 'foundation-rails'
gem 'faker'
gem "font-awesome-rails"
gem 'chartkick'
gem 'groupdate'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
