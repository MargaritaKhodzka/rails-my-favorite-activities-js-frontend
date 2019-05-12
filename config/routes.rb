Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :location_activities, only: [:show]

  resources :activities do
    resources :location_activities
  end

  resources :locations

  authenticated :user do
    root to: 'activities#index', as: :authenticated_root
  end

  root 'static#home'

  get 'favorites', to: 'static#favorites'
end
