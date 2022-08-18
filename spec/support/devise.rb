# frozen_string_literal: true

require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
  Devise::Mailer.delivery_method = :test
  Devise::Mailer.perform_deliveries = false
end
