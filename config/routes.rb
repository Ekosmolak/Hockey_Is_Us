Rails.application.routes.draw do
  get "Login", to: "sessions#new", as: :login
  post "Login", to: "sessions#create"

  get "Logout", to: "sessions#destroy", as: :logout

  get "Sign Up", to: "customers#new", as: :sign_up

  resource :cart, only: %i[show create destroy]
  resources :order_items
  resources :brands
  resources :categories
  resources :products do
    collection do
      get "search" => "products#search"
    end
  end

  resources :inventories
  resources :orders
  resources :customers

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about", to: "about#index", as: :about

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
