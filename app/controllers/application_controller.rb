class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def categories_group
    Category.top.group_by(&:parent_id)
  end

  def show_products_from_category_and_parents
    Product.products.group_by(&:category_id)
  end

  helper_method :categories_group, :show_products_from_category_and_parents
end
