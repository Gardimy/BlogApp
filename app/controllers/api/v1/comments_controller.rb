module Api
  module V1
    class CommentsController < ApplicationController
      before_action :find_post

      def create
        @comment = current_user.comments.build(comment_params)
        @comment.post = @post

        if @comment.save
          render json: @comment, status: :created
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def find_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
