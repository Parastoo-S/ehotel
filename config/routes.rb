Rails.application.routes.draw do
  resources :bookings
  resources :users
  resources :rooms
  resources :hotels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
  resources :chain
  resources :address
end
