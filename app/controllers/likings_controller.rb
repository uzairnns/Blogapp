# frozen_string_literal: true

class LikingsController < ApplicationController
  respond_to :js, :html, :json
  def create
    @like = current_user.likings.create(comment_id: params[:comment_id])
    redirect_to Comment.find(params[:comment_id]).post
  end

  def destroy
    @like = current_user.likings.find_by(id: params[:id])
    if @like.nil?
      file_not_found
    else
      @like.destroy
      redirect_to @like.comment.post
    end
  end

  private

  def like_params
    params.require(:liking).permit(:comment_id, :user_id, :id)
  end
end
