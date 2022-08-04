# frozen_string_literal: true

module Users
  class PostsController < UsersController
    respond_to :js, :html, :json

    def index
      @posts = Post.where(published: 'true')
      authorize @posts
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

    def edit; end

    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to post_url(@post), notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        redirect_to post_url(@post), notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      if @post.destroy
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
      else
        file_not_found
      end
    end

    def like
      @content = Post.find_by(id: params[:id])
      if @content.liked_by current_user
        redirect_to @content
      else
        file_not_found
      end
    end

    def dislike
      @content = Post.find_by(id: params[:id])
      if @content.disliked_by current_user
        redirect_to @content
      else
        file_not_found
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :content, :cover_picture, :published, :id)
    end
  end
end
