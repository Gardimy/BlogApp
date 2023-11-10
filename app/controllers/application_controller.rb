class ApplicationController < ActionController::Base
  before_action :load_ability


  protected

  def after_sign_in_path_for(_resource)
    users_path
  end

  def load_ability
    @ability = Ability.new(current_user)
  end
end
