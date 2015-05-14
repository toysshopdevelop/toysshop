class StoreController < ApplicationController
  layout 'store'

  def index
    @products = Product.order(created_at: :desc).take(50)
  end
end
