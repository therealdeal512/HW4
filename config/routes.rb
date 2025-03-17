Rails.application.routes.draw do
  root "places#index"

  resources :users, only: [:new, :create]
  get "/signup", to: "users#new"

  resources :sessions, only: [:new, :create]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :places  # Keep existing routes
end
