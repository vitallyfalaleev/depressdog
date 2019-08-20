Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts do
    resources :images, :only => [:create, :destroy]
  end
  resources :comments, :only => [:create, :update, :destroy]
  resources :likes, :only => [:create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  delete 'image' => 'comments#destroy_image'

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'home#index'
end
