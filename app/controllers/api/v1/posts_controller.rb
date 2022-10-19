# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      def index
        @posts = Post.all
        respond_to do |format|
          format.json
        end
      end

      def show
        @post = Post.find(params[:id])
        respond_to do |format|
          format.json
        end
      end

      def destroy
        Post.destroy(params[:id])
      end
    end
  end
end
