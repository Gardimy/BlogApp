class ApplicationController < ActionController::Base
  # Remove the before_action and set_current_user method
  # ...

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    user_index_path
  end
end
