Rails.application.routes.draw do
  get 'store/index'

  namespace :admin do
    resources :categories, :products, :orders
    root 'orders#index'
  end

  resources :categories

  root to: 'store#index', as: 'store'
end
