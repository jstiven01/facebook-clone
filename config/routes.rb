Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :index]
  resources :posts
  resources :friendships
  resources :comments, only: [:create, :destroy]
  resources :reactions, only: [:create, :destroy]

end
