Rails.application.routes.draw do
  resources :payments
  resources :bookings
  resources :users
  resources :rooms do
    # collection do
    #   get 'search'
    # end
  end
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
  resources :media
  resources :search do
    collection do
      get 'search'
    end
  end
end
