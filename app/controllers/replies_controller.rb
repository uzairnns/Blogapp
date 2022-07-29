# frozen_string_literal: true

class RepliesController < UsersController
  def create
    @suggestion = Suggestion.find_by(id: params[:suggestion_id])
    if @suggestion.nil?
      file_not_found
    else
      @suggestion.replies.create(user_id: current_user.id, body: params[:body])
      redirect_to @suggestion.post
    end
  end

  private

  def report_params
    params.require(:reply).permit(:suggestion_id, :body)
  end
end
