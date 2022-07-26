# frozen_string_literal: true

class LikingsController < ApplicationController
  def create
    @like = current_user.likings.new(like_params)

    unless @like.save
      # save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end

    redirect_to @like.comment.post
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
