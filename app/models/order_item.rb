class OrderItem < ApplicationRecord
  belongs_to :order, optional: true 
  belongs_to :product, optional: true

  validates :product_id, presence: true
  validates :order_id, presence: true, allow_nil: true

  def products
  	@products = Product.all
  end
end
