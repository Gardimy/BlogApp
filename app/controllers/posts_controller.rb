class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @posts = @user.posts
    @user = User.find(params[:user_id])
    id = params[:id]
    @targated_post = @posts.find(id)
    @comments = @targated_post.comments
  end
end
