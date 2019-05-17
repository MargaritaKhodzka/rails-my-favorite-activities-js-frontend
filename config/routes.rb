Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :activities do
    resources :user_activities
  end

  resources :locations

  authenticated :user do
    root to: 'activities#index', as: :authenticated_root
  end

  root 'static#home'
end
