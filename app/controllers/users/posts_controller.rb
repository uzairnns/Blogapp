# frozen_string_literal: true

module Users
  class PostsController < UsersController
    before_action :set_post, only: %i[edit update]
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
      render file: Rails.root.join('/public/404').to_s, layout: false, status: :not_found if @post.nil?
    end

    def edit; end

    def create
      byebug
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
      Post.find(params[:id]).destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    def like
      @content = Post.find(params[:id])
      @content.liked_by current_user
      redirect_to @content
    end

    def dislike
      @content = Post.find(params[:id])
      @content.disliked_by current_user
      redirect_to @content
    end

    private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :content, :cover_picture, :published, :id)
    end
  end
end
