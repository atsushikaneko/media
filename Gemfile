source 'https://rubygems.org'

gem 'rails',        '5.1.6'
gem 'therubyracer'
gem "i18n"
gem 'twitter'
gem 'impressionist'
gem 'bcrypt',         '3.1.12'
gem 'faker',  '1.9.1'
gem 'carrierwave',             '1.3.2'
gem 'mini_magick',             '4.7.0'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.3.7'
gem 'puma',         '3.9.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jquery-turbolinks'
gem 'jbuilder',     '2.7.0'
gem 'rake',         '13.0.1'
gem 'whenever', require: false
gem 'nokogiri'

group :development, :test do
  gem 'rb-readline'
  gem 'sqlite3', '~> 1.3.6'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem "selenium-webdriver"
end

group :production do
  gem 'mysql2'
  gem 'fog-aws'
end

group :production, :staging do
    gem 'unicorn', '5.4.1'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
