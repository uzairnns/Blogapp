# frozen_string_literal: true

module Users
  class CommentsController < UsersController
    before_action :set_post, only: %i[destroy create]
    before_action :set_comment, only: %i[destroy]
    before_action :authenticate_user!, only: %i[create destroy]
    before_action :current_user, only: %i[create destroy]

    def index
      @comments = Comment.all
    end

    def new
      @comment = Comment.new
    end

    def destroy
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully destroyed.'
    end

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @post, notice: 'post was successfully commented.'
      else
        redirect_to @post, alert: 'post not commented'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :comment, :cover_picture, :post_id, :id, :parent_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end
  end
end
