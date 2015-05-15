class SearchesController < ApplicationController
  layout 'store'

  def index
    @products = Product.search(params[:search]).page(params[:page]).per(20)
    render 'categories/show'
  end
end
