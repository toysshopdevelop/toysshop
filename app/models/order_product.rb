class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  delegate :image_name_url, :title, :price, :article, to: :product
end
