class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  layout 'admin'

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.title, c.id] }
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to [:admin, @product]
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product]
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit!
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
    end
  end
end
