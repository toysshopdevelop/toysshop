class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :destroy]
  before_filter :authenticate

  layout 'admin'

  def index
    @orders = Order.order(status: :desc, created_at: :desc)
              .page(params[:page]).per(20)
  end

  def edit
    @order.closed!
    redirect_to admin_orders_path
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_params
    params.require(:order).permit!
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
    end
  end
end
