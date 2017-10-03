ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'
require 'faker'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:each) do |context|
    unless context.metadata[:boot].eql? false
      DC.configure do |c|
        c.boot_files = %w[dummy]
      end
      DC.boot
    end
  end
  config.after(:each) do |context|
    unless context.metadata[:boot].eql? false
      DC.configure do |c|
        c.boot_files = nil
      end
    end
  end
end
