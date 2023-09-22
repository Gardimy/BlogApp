class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @set_current_user ||= User.first
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
