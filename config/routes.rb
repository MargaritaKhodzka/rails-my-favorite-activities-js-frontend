Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :locations do
    resources :activities, only: %i[index new create edit]
  end

  resources :activities, only: %i[show edit update]

  authenticated :user do
    root to: 'locations#index', as: :authenticated_root
  end

  root 'static#home'
end
