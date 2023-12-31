class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
