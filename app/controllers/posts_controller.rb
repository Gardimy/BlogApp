class PostsController < ApplicationController
	before_action :authenticate_user!

  def index
    @posts = @user.posts.includes(:comments).paginate(page: params[:page])
  end

  def show
    @targated_post = Post.find_by(id: params[:id])

    if @targated_post.nil?
      flash[:error] = 'Post not found'
      redirect_to root_path
    else
      @comments = @targated_post.comments
      @user = @targated_post.author
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
