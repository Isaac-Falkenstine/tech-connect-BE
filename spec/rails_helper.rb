# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'pry'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'simplecov'
SimpleCov.start do
  add_filter "/spec"
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
  DatabaseCleaner.strategy = :truncation
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
