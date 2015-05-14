class StoreController < ApplicationController
  layout 'store'

  def index
    @products = Product.order(created_at: :desc)
                .page(params[:page]).per(50)
  end
end
