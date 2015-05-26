class Order < ActiveRecord::Base
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products

  validates :name, :phone, :adress, presence: true

  enum status: [:active, :closed]

  def discount
    @discount ||= case sum.to_i
                  when 0..4999
                    0
                  when 5000..9999
                    sum * 0.05
                  when 10_000..14_999
                    sum * 0.1
                  else
                    sum * 0.15
                  end
  end

  def total
    sum - discount
  end
end
