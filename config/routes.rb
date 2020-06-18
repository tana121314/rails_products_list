Rails.application.routes.draw do
  get '/' => 'products#index'
  delete '/products/destroy_all' => 'products#destroy_all'
  resources :products
  resources :stocks
end
