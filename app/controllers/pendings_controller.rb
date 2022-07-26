# frozen_string_literal: true

class PendingsController < UsersController
  before_action :set_post, only: %i[edit]

  def index
    if current_user.moderator?
      @pending = Post.where(published: 'false').or(Post.where(published: nil))
    else
      redirect_to posts_path, alert: 'not authorized'
    end
  end

  def edit
    if current_user.moderator?
      @update = @post.update(published: 'true')
      redirect_to 'http://localhost:3000/pendings'
    else
      redirect_to posts_path, alert: 'not authorized'
    end
  end

  def show; end

  def set_post
    @post = Post.find(params[:id])
  end
end
