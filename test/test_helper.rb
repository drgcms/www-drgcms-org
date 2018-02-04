
ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require DrgCms.from_root('test/fixtures/drg_cms_test_data.rb')
Mongo::Logger.logger.level = ::Logger::FATAL

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
#  fixtures :all

  # Add more helper methods to be used by all tests here...
  #include Mongoid::FixtureSet::TestHelper
  #self.fixture_path = "#{Rails.root}/test/fixtures"
  drg_cms_test_data_load
end

