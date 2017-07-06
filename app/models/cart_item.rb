class CartItem < ApplicationRecord
	belongs_to :cart, inverse_of: :cart_items
	belongs_to :product
end
