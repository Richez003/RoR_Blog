Rails.application.routes.draw do
  resources :categories
  root 'movies#index'

  resources :movies do
    resources :likes
    resources :registrations
  end

  resource :session, only: %i[create destroy new]
  resources :users
  get 'signup' => 'users#new'
end
