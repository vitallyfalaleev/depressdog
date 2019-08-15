Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts
  resources :comments
  resources :likes

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'home#index'
end
