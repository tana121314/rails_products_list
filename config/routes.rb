Rails.application.routes.draw do
  get '/' => 'products#index'
  delete '/products/destroy_all' => 'products#destroy_all'
  # get '/stocks/:product_id' => 'stocks#new_stock'
  resources :products
  resources :stocks
  resources :stocks do
    get :new_stock
    post :create_stock
  end
end
