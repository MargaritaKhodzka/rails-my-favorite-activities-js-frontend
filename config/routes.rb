Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :activities do
    resources :location_activities
    resources :locations
  end

  resources :locations

  authenticated :user do
    root to: 'activities#index', as: :authenticated_root
  end

  root 'static#home'
end
