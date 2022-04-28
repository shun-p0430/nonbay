Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'
  resources :areas, only: [:index, :show] do
    resources :breweries, only: [:new, :create]
  end

  resources :breweries, only: [:index, :show] do
    resources :brands, only: [:new, :create]
  end
  
  resources :brands, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]
end