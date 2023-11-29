# frozen_string_literal: true

module Api
  module V2
    class PostsController < ApiController
      def index
        render json: Post.all
      end

      def show
        @post = Post.find(params[:id])
        render json: @post
      end

      def destroy
        Post.destroy(params[:id])
      end
    end
  end
end
