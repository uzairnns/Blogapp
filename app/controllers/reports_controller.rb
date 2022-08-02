# frozen_string_literal: true

class ReportsController < UsersController
  include ReportHelper
  def index
    if current_user.moderator?
      @reports = Post.joins(:reports).distinct
    else
      redirect_to posts_path, alert: 'not authorized'
    end
  end

  def create
    type = params[:type]
    if type == 'Post'
      # method calling for Post reporting
      post_create
    end
    return unless type == 'Comment'

    # method calling for Comment reporting
    comment_create
  end

  def destroy
    type = params[:type]
    if type == 'Post'
      # method callback for post unreporting
      post_delete
    end
    return unless type == 'Comment'

    # method callback for comment unreporting
    comment_delete
  end

  private

  def report_params
    params.require(:report).permit(:post_id, :id, :report_id, :type, :comment_id)
  end
end
