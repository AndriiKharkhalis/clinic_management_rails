Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  devise_for :users
  
  # User profile and appointments
  resource :profile, only: [:show]
  
  # Public part: Categories -> Doctors -> Appointments
  resources :categories, only: [:index, :show] do
    resources :doctors, only: [:index, :show] do
      resources :appointments, only: [:create] 
    end
  end

  # Doctor namespace for managing their profile and appointments
  namespace :doctors, as: :doctor do
    get "profiles/show"
    resource :profile, only: [:show]
    resources :appointments, only: [:update]
  end

  # API namespace for mobile app or external clients
    namespace :api do
    namespace :v1 do
      resources :doctors, only: [:index, :show]
    end
  end

  root to: "categories#index"
end
