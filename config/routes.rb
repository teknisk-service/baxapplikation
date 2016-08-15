Rails.application.routes.draw do

  resources :purchases
  resources :users
  resources :products

  get 'sessions/new'

  root 'static_pages#home'
  get  'static_pages/makeawish'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :products

end
