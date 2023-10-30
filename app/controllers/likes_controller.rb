class LikesController < ApplicationController
  before_action :find_post, only: [:create]

  def create
    @like = @post.likes.build
    @like.author = current_user

    if @like.save
      redirect_to @post, notice: 'Liked the post!'
    else
      redirect_to @post, alert: 'Failed to like the post.'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
