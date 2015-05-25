Rails.application.routes.draw do
  resources :orders, only: [:new, :create]

  get 'store/index'

  namespace :admin do
    resources :categories, :products
    resources :orders, only: [:index, :edit, :update, :destroy]
    root 'orders#index'
  end

  resources :categories

  root to: 'store#index', as: 'store'

  get 'search' => 'searches#index'

  resources :carts, only: [:update, :show, :destroy]
end
