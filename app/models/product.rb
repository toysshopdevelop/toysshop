class Product < ActiveRecord::Base
  validates :title, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  mount_uploader :image_name, ProductUploader

  belongs_to :category
end
