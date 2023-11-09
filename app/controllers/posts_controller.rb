class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_user, only: %i[index new create]

  def index
    @posts = @user.posts.includes(:comments)
  end

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

  private

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
