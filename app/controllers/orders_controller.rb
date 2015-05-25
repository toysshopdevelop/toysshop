class OrdersController < ApplicationController
  layout 'store'

  def new
    @products = Product.where(id: session[:cart])
    @order = Order.new(products: @products)
  end

  def create
    return if session[:cart].nil?
    @order = Order.create(order_params)
    if @order.save
      flash[:success] = t('order.created')
      redirect_to store_path
      session[:cart] = nil
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
