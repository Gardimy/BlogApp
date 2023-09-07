class PostsController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
