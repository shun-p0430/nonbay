Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'
  resources :areas, only: [:index, :show]
  resources :breweries, only: [:index, :show]
  resources :brands, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
end