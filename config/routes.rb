Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :destroy]

  get 'store/index'

  namespace :admin do
    resources :categories, :products, :orders
    root 'orders#index'
  end

  resources :categories

  root to: 'store#index', as: 'store'

  get 'search' => 'searches#index'

  resources :carts, only: [:update, :show, :destroy]
end
