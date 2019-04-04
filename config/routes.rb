Rails.application.routes.draw do
  resources :payments
  resources :bookings
  resources :users
  resources :rooms
  resources :hotels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
  resources :chain do
    get 'edit'
    get 'show'
    delete 'destroy'
    # member do
    #   patch 'update'
    # end
  end
  resources :address
  # get 'media'
  resources :media
end
