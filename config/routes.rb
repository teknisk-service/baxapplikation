Rails.application.routes.draw do

  resources :pingpongs
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
      post "/remove_admin"   => "users#remove_admin",   :as => :remove_user_admin
      post "/delete_purchases" => "users#delete_purchases", :as => :delete_purchases
    end
  end
  resources :products
  resources :requests do
    member do
      put "upvote", to: "requests#upvote"
      put "downvote", to: "requests#downvote"
    end
  end
  resources :payments
  resources :orders
  resources :outlays
  resources :whitelists
  resources :shared_purchases do
    member do
      get '/shared_purchases', to: 'shared_purchases#new'
    end
  end

  resources :teams


  get 'sessions/new'

  get 'admins', to: 'static_pages#admins'

  root 'static_pages#home'
  get  'static_pages/makeawish'
  get  '/signup',  to: 'users#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/toplists', to: 'users#toplists'
  get '/baxbollstoppen', to: 'users#baxbollstoppen'
  get '/alkoholtoppen', to: 'users#alkoholtoppen'
  get '/pingis', to: 'pingpongs#index'
end
