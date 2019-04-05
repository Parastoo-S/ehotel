Rails.application.routes.draw do
  root "home#index"
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  get 'users/new'


  resources :rooms
  resources :hotels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chain
  resources :address
  # get 'media'
  resources :media
end
