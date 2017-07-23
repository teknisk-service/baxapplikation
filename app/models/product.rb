class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :purchases
  has_many :orders, through: :order_items
  has_many :order_items, inverse_of: :product

  def total_quantity
  	OrderItem.where(product: self).sum(:quantity)
  end
end
