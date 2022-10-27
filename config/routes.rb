# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  root 'users#index'

  resources :users do
  resources :posts
  resources :likes
  end

  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
