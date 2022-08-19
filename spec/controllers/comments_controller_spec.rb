# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Users::CommentsController do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user1) { user.confirm }
  let!(:post) { FactoryBot.create(:post, user_id: user.id) }
  let!(:comment) { FactoryBot.create(:comment, post_id: post.id, user_id: user.id) }
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }
  before { sign_in user }

  describe 'COMMENT #create' do
    it 'create comment on user post' do
      get :create, params: { comment: { body: 'MyText' }, post_id: post.id }
      expect(flash[:notice]).to match('post was successfully commented.')
    end
    it 'create comment on user post negative case' do
      get :create, params: { comment: { body: '' }, post_id: post.id }
      expect(flash[:notice]).to match('post not commented')
    end

    it 'create comment on user post invalid' do
      get :create, params: { comment: { body: 'MyText' }, post_id: -1 }
      expect(flash[:notice]).to match(nil)
      expect(response).to render_template(file: '404.html')
    end
  end

  describe 'COMMENT #destroy' do
    it 'destroy comment on user post' do
      delete :destroy, params: { id: comment.id, post_id: post.id }
      expect(flash[:notice]).to match('Comment was successfully destroyed.')
    end

    it 'create comment on user post invalid' do
      delete :destroy, params: { id: comment.id, post_id: -1 }
      expect(flash[:notice]).to match(nil)
    end

    it 'create comment on user comment invalid' do
      delete :destroy, params: { id: -1, post_id: post.id }
      expect(flash[:notice]).to match(nil)
    end
  end
end
