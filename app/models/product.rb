class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :purchases
  has_many :orders, through: :order_items
  has_many :order_items, inverse_of: :product
end
