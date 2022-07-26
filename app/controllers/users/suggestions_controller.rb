# frozen_string_literal: true

module Users
  class SuggestionsController < UsersController
    before_action :set_post, only: %i[edit update destroy create]
    before_action :set_comment, only: %i[destroy]
    before_action :authenticate_user!, only: %i[create destroy]
    before_action :current_user, only: %i[create destroy edit]

    def index
      @suggestions = Suggestion.all
    end

    def edit; end

    def new
      @suggestion = Suggestion.new
    end

    def update
      if @suggestion.update(suggestion_params)
        redirect_to @post, notice: 'Post was successfully Suggested.'
      else
        render :edit
      end
    end

    def destroy
      @suggestion.destroy
      redirect_to @post, notice: 'Suggestion was successfully destroyed.'
    end

    def create
      @suggestion = @post.suggestions.build(suggestion_params)
      @suggestion.user = current_user
      if @suggestion.save
        redirect_to @post, notice: 'post was successfully suggested.'
      else
        redirect_to @post, alert: 'post not commented'
      end
    end

    private

    def suggestion_params
      params.require(:suggestion).permit(:body, :user_id, :post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @suggestion = @post.suggestions.find(params[:id])
    end
  end
end
