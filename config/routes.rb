Rails.application.routes.draw do
  root to: "welcome#index"


  devise_for :customers

  resources :cart, only: %i[show create destroy]
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

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
