# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :posts do
    resources :images, only: %i[create destroy]
  end

  resources :comments, only: %i[create update destroy]
  resources :likes, only: %i[create destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  delete 'image' => 'comments#destroy_image'

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  mount ActionCable.server => '/cable'

  root 'home#index'
end
