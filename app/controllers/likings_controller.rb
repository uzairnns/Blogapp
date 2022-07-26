# frozen_string_literal: true

class LikingsController < ApplicationController
  respond_to :js, :html, :json
  def create
    @like = current_user.likings.create(comment_id: params[:comment_id])
    respond_to do |format|
      format.html { redirect_to Comment.find(params[:comment_id]).post }
      format.json { render :show, status: :ok, location: @like.comments.post }
    end
  end

  def destroy
    @like = current_user.likings.find_by(id: params[:id])
    @like.destroy

    redirect_to @like.comment.post
  end

  private

  def like_params
    params.require(:liking).permit(:comment_id, :user_id, :id)
  end
end
