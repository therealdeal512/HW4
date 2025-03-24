Rails.application.routes.draw do
  root "home#index"

  # User sign up
  get "/signup", to: "users#new", as: "signup"
  resources :users, only: [:new, :create]

  # Login / logout
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  # Places & entries nested routes
  resources :places do
    resources :entries
  end
end


