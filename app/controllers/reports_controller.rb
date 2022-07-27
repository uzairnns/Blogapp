# frozen_string_literal: true

class ReportsController < UsersController
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

  def comment_delete
    @report = Report.find(params[:report_id])
    @report.destroy
    comment = Comment.find(params[:comment_id])
    redirect_to comment.post
  end

  def post_delete
    @report = Report.find(params[:report_id])
    @report.destroy
    post = Post.find(params[:id])
    redirect_to post
  end

  def comment_create
    comment = Comment.find(params[:comment_id])
    report = comment.reports.create(user_id: current_user.id)
    unless report.save
      # comment report saving
      flash[:notice] = report.errors.full_messages.to_sentence
    end
    redirect_to comment.post
  end

  def post_create
    @post = Post.find(params[:post_id])
    @report = @post.reports.create(user_id: current_user.id)

    unless @report.save
      # save
      flash[:notice] = @report.errors.full_messages.to_sentence
    end

    redirect_to @post
  end

  private

  def report_params
    params.require(:report).permit(:post_id, :id, :report_id, :type, :comment_id)
  end
end
