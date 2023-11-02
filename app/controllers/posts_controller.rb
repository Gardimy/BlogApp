class PostsController < ApplicationController
  before_action :find_user, only: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @targated_post = Post.find_by(id: params[:id])

    if @targated_post.nil?
      flash[:error] = 'Post not found'
      redirect_to user_posts_path(@user)
    else
      @comments = @targated_post.comments
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
