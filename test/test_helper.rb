#ENV["RAILS_ENV"] = "test"
Rails.env = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all

  # Add more helper methods to be used by all tests here...
  include Mongoid::FixtureSet::TestHelper
  self.fixture_path = "#{Rails.root}/test/fixtures"  
end

def db_clear
#  DcUser.all.delete
#  DcSite.all.delete
end