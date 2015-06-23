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
      session[:cart] = nil
      redirect_to store_path
      Notification.order_notification.deliver_now
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
