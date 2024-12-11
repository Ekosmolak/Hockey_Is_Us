Rails.application.routes.draw do
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  get "Login", to: "sessions#new", as: :login
  post "Login", to: "sessions#create"

  get "Logout", to: "sessions#destroy", as: :logout

  get "Sign Up", to: "customers#new", as: :sign_up
  get "View Profile", to: "customers#show", as: :profile_show

  resources :contacts, only: [ :create, :new ]
  resources :cart, only: [ :show, :create, :destroy ]
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

  root to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about", to: "about#index", as: :about

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
