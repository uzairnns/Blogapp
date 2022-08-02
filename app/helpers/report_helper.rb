# frozen_string_literal: true

module ReportHelper
  def comment_delete
    report = Report.find_by(id: params[:report_id])
    if report.destroy
      comment = Comment.find(params[:comment_id])
      redirect_to comment.post
    else
      file_not_found
    end
  end

  def post_delete
    report = Report.find_by(id: params[:report_id])
    if report.nil?
      file_not_found
    else
      report.destroy
    end
    redirect_to_post
  end

  def redirect_to_post
    post = Post.find_by(id: params[:id])
    if post
      redirect_to post
    else
      file_not_found
    end
  end

  def comment_create
    comment = Comment.find_by(id: params[:comment_id])
    if comment.nil?
      file_not_found
    else
      comment.reports.create(user_id: current_user.id)
    end
    redirect_to comment.post
  end

  def post_create
    post = Post.find(params[:post_id])
    report = post.reports.create(user_id: current_user.id)

    unless report.save
      # save
      flash[:notice] = report.errors.full_messages.to_sentence
    end

    redirect_to post
  end
end
