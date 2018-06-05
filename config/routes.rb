Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bands do
    resources :bookings
  end

  resources :venues do
    resources :bookings
  end

  resources :bookings
  get "bookings/:id/booking_data", to: "bookings#booking_data"
  get "bands/:id/next", to: "bands#next"
  
  resources :users, only: [:new, :create]

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"


  root "static#welcome"

  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
