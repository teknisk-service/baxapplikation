Rails.application.routes.draw do

  resources :orders
  resources :purchases do 
    collection do 
        get 'remove_all'
      end
    end
  resources :users do
    member do
      get '/purchases', to: 'users#purchases'
      post "/set_admin"   => "users#set_admin",   :as => :make_user_admin
    end
  end
  resources :products
  resources :comments 
  resources :payments
  resources :orders


  get 'sessions/new'

  get 'admins', to: 'static_pages#admins'

  root 'static_pages#home'
  get  'static_pages/makeawish'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
