Rails.application.routes.draw do
  get '/' => 'products#index'
  delete '/products/destroy_all' => 'products#destroy_all'
  resources :products
  resources :stocks
  resources :stocks do
    member do
      get :new_stock
      post :create_stock
    end
  end
end
