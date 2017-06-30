class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :purchases
  has_many :order_items
end
