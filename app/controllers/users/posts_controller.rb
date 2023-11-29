# frozen_string_literal: true

module Users
  class PostsController < UsersController
    respond_to :js, :html, :json
    after_action :track_action

    def index
      @posts = Post.all.order(:id)
      flash[:alert] = 'all users posts'
    end

    def current_user_posts
      @posts = current_user.posts.all
    end

    def current_user_suggested_posts
      @posts = Post.where(id: Suggestion.where(user_id: current_user.id).pluck(:post_id))
    end

    def new
      @post = current_user.posts.build
    end

    def show
      @post = Post.find_by(id: params[:id])
      if @post.nil?
        file_not_found
      elsif @post.published? == false
        if current_user.id != @post.user_id && !current_user.moderator?
          flash[:alert] = 'you are not authorized to perform this action'
          redirect_to(request.referer || root_path)
        end
      end
    end

    def edit
      @post = Post.find_by(id: params[:id])
    end

    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        ActionCable.server.broadcast 'post', {
          post: PostsController.render(
            partial: 'post',
            locals: { post: @post }
          ).squish
        }
        redirect_to post_url(@post), notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity, notice: 'Post created unsuccessfully'
      end
    end

    def update
      @post = Post.find_by(id: params[:id])
      if !@post.nil?
        @post.update(post_params)
        redirect_to post_url(@post), notice: 'Post was successfully updated.'
      else
        file_not_found
      end
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      if !@post.nil?
        @post.destroy
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
      else
        file_not_found
      end
    end

    def like
      @content = Post.find_by(id: params[:id])
      if !@content.nil?
        @content.liked_by current_user
        redirect_to @content
      else
        file_not_found
      end
    end

    def dislike
      @content = Post.find_by(id: params[:id])
      if !@content.nil?
        @content.disliked_by current_user
        redirect_to @content
      else
        file_not_found
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :content, :cover_picture, :published, :id)
    end

    def track_action
      ahoy.track 'Ran action', request.path_parameters
    end
  end
end
