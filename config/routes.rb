# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: redirect('/posts', status: 302)
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'home/index'
  root 'home#index'
  scope module: 'users' do

    resources :posts do
      member do
        put 'like'
        put 'dislike'
      end
      collection do
        get :current_user_posts
        get :current_user_suggested_posts
      end
      resources :comments, only: %i[create destroy]
      resources :suggestions
    end
  end
  resources :pendings
  resources :reports, only: %i[create destroy index]
  resources :likings, only: %i[create destroy]
  resources :reports, only: %i[create destroy]
  resources :replies
end
