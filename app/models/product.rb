class Product < ActiveRecord::Base
  validates :title, :article, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_name, allow_blank: true, format: {
    with: /\.(jpg|png)/,
    message: ' must be .jpg or .png file'
  }

  belongs_to :category

  mount_uploader :image_name, ProductUploader
end
