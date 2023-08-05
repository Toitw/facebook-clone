Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :friend_requests, only: [:index, :create, :update, :destroy]
  resources :posts
  resources :comments, only: [:create, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :users, only: [:index, :show]

end
