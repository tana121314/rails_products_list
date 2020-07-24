Rails.application.routes.draw do
  devise_for :users

  # トップページに商品一覧
  get '/' => 'products#index'

  # Ajax練習
  get '/practices/index'
  post 'practices/index'

  # 商品一覧の一括削除機能
  delete '/products/destroy_all' => 'products#destroy_all'

  resources :products

  # 在庫追加（在庫一覧の追加リンクから対象商品を直接選択する方法）
  resources :stocks do
    member do
      get :new_stock
      post :create_stock
      get :edit_stock
      patch :update_stock
    end
  end
end
