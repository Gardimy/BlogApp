class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user = User.find(user_id)
    @posts = @user.posts
  end
end
