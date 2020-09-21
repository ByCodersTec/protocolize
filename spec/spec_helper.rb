require 'simplecov'
SimpleCov.start

require_relative 'dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('dummy/db/migrate', __dir__)]
