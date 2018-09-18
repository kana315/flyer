Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :registrations => "users/registrations",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations"
  }
  resources :troupes, only: [:new, :create, :edit, :update, :index] do
    member do
      get :member_request, :member_relations, :waiting_members
    end
  end
  get '/troupes/:id', to: 'troupes#posts', as: 'troupe_posts'

  resources :member_relations, only: [:create, :destroy]
  resources :member_requests, only: [:create, :destroy]

  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :troupe_followings, only: [:create, :destroy]

  get 'users/:id', to: 'users#posts', as: 'user'
  get 'users/:id/favorites', to: 'users#favorites', as: 'user_favorites'
  get 'users/:id/troupes', to: 'users#troupes', as: 'user_troupes'
  get 'users/:id/member_requests', to: 'users#member_requests', as: 'user_member_requests'
  get 'users/:id/following_troupes', to: 'users#following_troupes', as: 'user_following_troupes'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
