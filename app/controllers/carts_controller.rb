class CartsController < ApplicationController
  layout 'store'

  def update
    session[:cart] = [] if session[:cart].nil?
    session[:cart] << params[:id] unless session[:cart].include?(params[:id])
  end

  def show
    @products = Product.where(id: session[:cart])
    #   require 'pry'; binding.pry
  end

  def destroy
    session[:cart].delete(params[:id])
    session[:cart] = nil if session[:cart].empty?
  end
end
