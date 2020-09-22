require 'simplecov'
SimpleCov.start

require_relative 'dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('dummy/db/migrate', __dir__)]

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end