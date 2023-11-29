# frozen_string_literal: true

module Api
  module V2
    class ApiController < ApplicationController
      skip_before_action :verify_authenticity_token
    end
  end
end
