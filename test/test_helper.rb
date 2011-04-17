ENV["RAILS_ENV"] = "test"

require File.expand_path('../rails_app/config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  self.fixture_path = File.expand_path('../fixtures', __FILE__)
  fixtures :all
end

class ActionDispatch::IntegrationTest
  self.fixture_path = File.expand_path('../fixtures', __FILE__)
  include Capybara
end
