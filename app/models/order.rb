class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true

	def order_items 
		@order_items = OrderItem.all
	end
end
