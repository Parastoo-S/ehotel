Rails.application.routes.draw do
  root "home#index"
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post '/signup',  to: 'users#create'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  get 'users/new'

  resources :payments
  resources :bookings
  resources :users
  resources :rooms
  resources :hotels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chain
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
