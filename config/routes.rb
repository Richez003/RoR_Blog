# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  resources :users do
  resources :posts  do
  resources :likes, only: [:create, :destroy]
  end
end
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
