Rails.application.routes.draw do

  root 'products#index'

  resources :products

  root 'users#index'

  resources :users

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/products' => 'products#index', as: :products
  #
  # get '/products/new' => 'products#new', as: :new_product
  #
  # post '/products/id:/edit' => 'products#edit', as: :edit_product
  #
  # patch '/products:id' => 'products#update'
  #
  # delete '/products/:id' => 'products#destroy'
end
