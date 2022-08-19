# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar moderator])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

  private

  def after_sign_in_path_for(_resource)
    posts_url
  end

  def file_not_found
    render file: Rails.root.join('/public/404').to_s, layout: false, status: :not_found, notice: 'not found'
  end
end
