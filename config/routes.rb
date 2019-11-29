Rails.application.routes.draw do
  root 'posts#index'
  #get 'users/index'
  #get 'users/show'
  devise_for :users
  resources :users, only: [:show, :index]
  resources :posts
  #devise_scope :user do
  #  root to: "devise/sessions#new"
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
