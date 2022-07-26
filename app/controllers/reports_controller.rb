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
      postcreate
    end
    return unless type == 'Comment'

    # method calling for Comment reporting
    commentcreate
  end

  def destroy
    type = params[:type]
    if type == 'Post'
      # method callback for post unreporting
      postdelete
    end
    return unless type == 'Comment'

    # method callback for comment unreporting
    commentdelete
  end

  def commentdelete
    @report = Report.find(params[:report_id])
    @report.destroy
    comment = Comment.find(params[:comment_id])
    redirect_to comment.post
  end

  def postdelete
    @report = Report.find(params[:report_id])
    @report.destroy
    post = Post.find(params[:id])
    redirect_to post
  end

  def commentcreate
    comment = Comment.find(params[:comment_id])
    report = comment.reports.create(user_id: current_user.id)
    unless report.save
      # comment report saving
      flash[:notice] = report.errors.full_messages.to_sentence
    end
    redirect_to comment.post
  end

  def postcreate
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
