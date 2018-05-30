Rails.application.routes.draw do
  root "home_page#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/history", to: "histories#index"

  resources :tours, only: %i(index show)
  resources :users, only: :show
  resources :categories, only: :show
  resources :reviews, only: :create
  resources :ratings, only: %i(create update)

  namespace :admin do
    root "dashboard#index"
    resources :bookings, only: %i(index show update)
  end
end
