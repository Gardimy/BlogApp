class PostsController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @targated_post = Post.find_by(id: params[:id])

    if @targated_post.nil?
      flash[:error] = 'Post not found'
      redirect_to root_path
    else
      @user = @targated_post.author # Retrieve the author of the post
      @comments = @targated_post.comments
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:user_id])

    unless @user
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end
end
