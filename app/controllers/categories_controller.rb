class CategoriesController < ApplicationController
  layout 'store'

  def index
  end

  def show
    @products = Product.for_category(params[:id]).page(params[:page]).per(20)
  end

  helper_method :for_category
end
