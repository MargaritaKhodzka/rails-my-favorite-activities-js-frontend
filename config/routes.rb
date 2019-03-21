Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :locations do
    :activities
  end

  authenticated :user do
    root to: 'locations#index', as: :authenticated_root
  end

  root 'static#home'
end
