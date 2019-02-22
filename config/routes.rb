Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post "/direction_create" => "recipes#direction_create"
  resources :directions

  resources :users
  resources :recipes
end
