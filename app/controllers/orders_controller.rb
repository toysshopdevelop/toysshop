class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout 'store'

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @products = Product.where(id: session[:cart])
    @order = Order.new(products: @products)
  end

  def edit
  end

  def create
    if !session[:cart].nil?
      @order = Order.create(order_params)
      flash[:success] = t('order.created')
      redirect_to store_path
      session[:cart] = nil
    else
      redirect_to store_path
    end
  end

  def update
    @order.update(order_params)
    redirect_to store_path
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
