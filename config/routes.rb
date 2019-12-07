Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :users, only: [:show, :index]
  resources :posts
  resources :friendships
  resources :comments, only: [:create, :destroy]
  resources :reactions, only: [:create, :destroy]

end
