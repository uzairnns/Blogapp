# frozen_string_literal: true

module Users
  class PostsController < UsersController
    before_action :set_post, only: %i[edit update]
    respond_to :js, :html, :json

    def index
      # @posts = current_user.posts.where(published: 'true')
      @posts = Post.where(published: 'true')
      authorize @posts
    end

    def my_post
      @posts = current_user.posts.all
    end

    def my_suggestion
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
      @post = current_user.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      Post.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      end
    end

    def like
      @content = Post.find(params[:id])
      @content.liked_by current_user
      respond_to do |format|
        format.html { redirect_to @content }
        format.json { render :show, status: :ok, location: @content }
      end
    end

    def dislike
      @content = Post.find(params[:id])
      @content.disliked_by current_user
      respond_to do |format|
        format.html { redirect_to @content }
        format.json { render :show, status: :ok, location: @content }
      end
    end

    private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :content, :published, :id)
    end
  end
end
