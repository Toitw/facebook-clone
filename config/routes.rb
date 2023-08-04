Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :friend_requests, only: [:index, :create, :update, :destroy]
  resources :post
  resources :comment, only: [:create, :update, :destroy]
  resources :like, only: [:create, :destroy]

end
