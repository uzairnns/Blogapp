# frozen_string_literal: true

module Users
  class SuggestionsController < UsersController
    before_action :set_post, only: %i[edit destroy create]
    before_action :set_comment, only: %i[destroy]
    before_action :authenticate_user!, only: %i[create destroy]
    before_action :current_user, only: %i[create destroy]

    def index
      @suggestions = Suggestion.all
    end

    def edit

      @body = Suggestion.find(params[:id]).body
      @post.update(description: @body)
      redirect_to @post
    end

    def new
      @suggestion = Suggestion.new
    end

    def update
      buebug
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
        redirect_to @post, alert: 'post not suggested'
      end
    end

    private

    def suggestion_params
      params.require(:suggestion).permit(:body, :user_id, :post_id)
    end

    def set_post
      @post = Post.find_by(id: params[:post_id])
      file_not_found if @post.nil?
    end

    def set_comment
      @suggestion = @post.suggestions.find_by(id: params[:id])
      file_not_found if @suggestion.nil?
    end
  end
end
