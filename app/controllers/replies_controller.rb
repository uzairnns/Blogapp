# frozen_string_literal: true

class RepliesController < UsersController
  def create
    @suggestion = Suggestion.find(params[:suggestion_id])
    @suggestion.replies.create(user_id: current_user.id, body: params[:body])
    redirect_to @suggestion.post
  end

  private

  def report_params
    params.require(:reply).permit(:suggestion_id, :body)
  end
end
