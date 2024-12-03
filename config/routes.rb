Rails.application.routes.draw do
  resources :brands
  resources :categories
  resources :products
  resources :inventories
  resources :orders
  resources :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about", to: "about#index", as: :about

  get "/products", to: "products#index"
  get "/products/:id", to: "products#show"

  get "/brands", to: "brandss#index"
  get "/brands/:id", to: "brands#show"

  get "/categories", to: "categories#index"
  get "/categories/:id", to: "categories#show"

  get "/customers", to: "customers#index"
  get "/customers/:id", to: "customers#show"

  get "/inventories", to: "inventories#index"
  get "/inventories/:id", to: "inventories#show"

  get "/orderitems", to: "orderitems#index"
  get "/orderitems/:id", to: "orderitems#show"

  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
