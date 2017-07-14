class OrderItem < ApplicationRecord
  belongs_to :order, optional: true 
  belongs_to :product, optional: true
end
