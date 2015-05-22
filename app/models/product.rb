class Product < ActiveRecord::Base
  validates :title, :article, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_name, allow_blank: true, format: {
    with: /\.(jpg|png)/,
    message: ' must be .jpg or .png file'
  }

  belongs_to :category
  has_many :order_products
  mount_uploader :image_name, ProductUploader

  scope :for_category, lambda { |category|
    joins(:category)
      .where('products.category_id = ? or
         categories.parent_id = ?', category, category)
      .group('products.id')
  }

  scope :search, lambda { |search|
    joins(:category)
      .where('products.title ILIKE ? or
         categories.title ILIKE ?', "%#{search}%", "%#{search}%")
      .group('products.id')
  }
end
