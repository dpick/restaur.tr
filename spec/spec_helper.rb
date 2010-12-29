ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'webrat'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Webrat::Matchers, :type => :views
  config.include Devise::TestHelpers, :type => :controller
  config.mock_with :rspec
end
