class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters
  before_action :load_ability

  # ...

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def load_ability
    @ability = Ability.new(current_user)
  end
end
