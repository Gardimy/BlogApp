class ApplicationController < ActionController::Base
  before_action :load_ability
#  before_action :configure_permitted_parameters

  # ...

  protected

  def after_sign_in_path_for(resource)
    user_index_path
  end

  def load_ability
    @ability = Ability.new(current_user)
  end
end
