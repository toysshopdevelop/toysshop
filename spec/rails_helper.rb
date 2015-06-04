# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner'
require 'rack_session_access/capybara'

Capybara.asset_host = 'http://localhost:3000'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryGirl::Syntax::Methods

  config.include Rails.application.routes.url_helpers

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.before :suite do
    I18n.locale = :ru
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each, js: true do
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    begin
      DatabaseCleaner.clean
    rescue
      nil
    end
  end
end
