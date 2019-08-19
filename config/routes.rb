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

  root 'home#index'
end
