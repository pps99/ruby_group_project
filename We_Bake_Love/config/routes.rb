Rails.application.routes.draw do
  resources :admin_order_lists
  resources :user_details
  get "/accept", to: "user_details#accept"
  get "/cancel", to: "user_details#cancel"

  get "carts/show"
  resources :cakes do
    collection { post :import }
  end

  resources :cart_items
  resource :carts, only: [:show]

  root "home_page#index"
  # Home
  get "home_page", to: "home_page#index"
  get "/search", to: "home_page#search"
  get "/carts", to: "carts_controller#show"
  get "/cancel_cart_item", to: "cart_items#cancel"
  resources :users
  post "/handle_login", to: "users#validate_login"
  get "/send_mail", to: "posts#send_mail"
  get "/promote", to: "users#promote"
  get "/degrade", to: "users#degrade"
  get "/logout", to: "users#logout"
  get "/viewer", to: "users#viewer"
  post "/search_database", to: "users#search"
  get "/search_database", to: "users#index"
  get "/handle_login", to: "users#handle_login"
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  post "password/reset/edit", to: "password_resets#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
