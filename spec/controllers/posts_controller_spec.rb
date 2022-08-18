# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Users::PostsController do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user1) { user.confirm }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:user3) { user2.confirm }
  let!(:post) { FactoryBot.create(:post, user_id: user.id) }
  let!(:post2) { FactoryBot.create(:post, user_id: user2.id) }

  before { @request.env['devise.mapping'] = Devise.mappings[:user] }
  before { sign_in user }

  describe 'GET#index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status('200')
      expect(flash[:alert]).to match('all users posts')
    end
  end

  describe 'GET#current_user_posts' do
    it 'renders the current user posts template' do
      get :current_user_posts
      expect(response).to have_http_status('200')
    end
  end

  describe 'GET#current_user_suggested_posts' do
    it 'renders the index template' do
      get :current_user_suggested_posts
      expect(response).to have_http_status('200')
    end
  end

  describe 'GET#new' do
    it 'renders the new template' do
      get :new
      expect(response).to have_http_status('200')
    end
  end

  describe 'GET#show' do
    it 'renders the show template for autharized user' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status('200')
      expect(flash[:alert]).to match(nil)
    end

    it 'renders the home template for unautharized user' do
      get :show, params: { id: post2.id }
      expect(flash[:alert]).to match('you are not authorized to perform this action')
    end

    it 'show message for post not found' do
      get :show, params: { id: 1545 }
      expect(flash[:status]).to match(nil)
    end
  end

  describe 'POST #create' do
    it 'create user post' do
      get :create, params: { post: { title: 'Sideshow', description: 'Bob', content: 'Sideshow Bob' } }
      expect(flash[:notice]).to match('Post was successfully created.')
    end
  end

  describe 'PATCH #update' do
    it 'update user post' do
      patch :update, params: { id: post.id, post: { title: 'Sideshow', description: 'Bob', content: 'Sideshow Bob' } }
      expect(flash[:notice]).to match('Post was successfully updated.')
    end
  end

  describe 'DELETE #destroy' do
    it 'delete user post' do
      delete :destroy, params: { id: post.id }
      expect(flash[:notice]).to match('Post was successfully destroyed.')
    end

    it 'delete user post' do
      delete :destroy, params: { id: 1155 }
      expect(flash[:notice]).to match(nil)
    end
  end

  describe 'LIKE #like' do
    it 'likes the  user post' do
      put :like, params: { id: post.id }
      expect(flash[:notice]).to match('Post was successfully liked.')
    end

    it 'likes the  user post' do
      put :like, params: { id: -1 }
      expect(flash[:notice]).to match(nil)
    end
  end

  describe 'DISLIKE #dislike' do
    it 'Dislike the  user post' do
      put :dislike, params: { id: post.id }
      expect(flash[:notice]).to match('Post was successfully unliked.')
    end

    it 'likes the  user post' do
      put :dislike, params: { id: -1 }
      expect(flash[:notice]).to match(nil)
    end
  end
end
