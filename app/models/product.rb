class Product < ApplicationRecord
  validates :name, presence: true

  has_many :purchases
  has_many :orders, through: :order_items
  has_many :order_items, inverse_of: :product

  def product_price 
    if (OrderItem.where(product: self).sum(:quantity) > 0) 
  	 OrderItem.where(product: self).sum(:price) / OrderItem.where(product: self).sum(:quantity) 
    else 
      0
    end
  end

  def set_price
  	@price = self.product_price 
  	update_attribute(:price, @price)
  end

  def total_quantity
    OrderItem.where(product: self).sum(:quantity)
  end
end
