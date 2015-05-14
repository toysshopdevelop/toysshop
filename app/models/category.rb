class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :products

  scope :top, lambda {
    Category.joins('LEFT OUTER JOIN categories cts ON
      categories.id = cts.parent_id')
      .joins('INNER JOIN products ON products.category_id = cts.id
      OR products.category_id = categories.id')
      .group('categories.id')
  }
end
