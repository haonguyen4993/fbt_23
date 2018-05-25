Rails.application.routes.draw do
  root "home_page#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    root "dashboard#index"
    resources :bookings, only: %i(index show update)
  end
  resources :tours, only: :show
end
