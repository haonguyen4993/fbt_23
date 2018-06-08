Rails.application.routes.draw do
  root "home_page#home"

  devise_for :users, skip: %i(sessions registrations)
  as :user do
    get "/login", to: "devise/sessions#new", as: :new_user_session
    post "/login", to: "devise/sessions#create", as: :user_session
    delete "/logout", to: "devise/sessions#destroy", as: :destroy_user_session

    get "/signup", to: "devise/registrations#new", as: :new_user_registration
    post "/signup", to: "devise/registrations#create", as: :user_registration
  end

  get "/history", to: "histories#index"

  resources :tours, only: %i(index show)
  resources :users, only: :show
  resources :categories, only: :show
  resources :reviews, only: :create
  resources :ratings, only: %i(create update)
  resources :bookings, only: %i(new create)

  namespace :admin do
    root "dashboard#index"
    resources :bookings, only: %i(index show update)
    resources :categories, except: %i(new edit update)
    resources :tours do
      resources :description_details, except: %i(index show)
    end
  end
end
