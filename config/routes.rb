Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :activities do
    resources :location_activities
    resources :locations
  end

  resources :locations
  root 'static#home'

  # authenticated :user do
  #   root to: 'static#welcome', as: :authenticated_root
  # end

end
