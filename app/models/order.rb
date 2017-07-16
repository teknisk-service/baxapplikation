class Order < ApplicationRecord
	has_many :order_items, inverse_of: :order
	has_many :products, :through => :order_items, :class_name => 'Product'
	
	accepts_nested_attributes_for :order_items, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :products, :reject_if => :all_blank, :allow_destroy => true


	def order_items 
		@order_items = OrderItem.all
	end
end
