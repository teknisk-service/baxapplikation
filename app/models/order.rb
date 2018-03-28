class Order < ApplicationRecord
	has_many :order_items, inverse_of: :order, dependent: :destroy
	has_many :products, :through => :order_items, :class_name => 'Product', dependent: :destroy
	
	accepts_nested_attributes_for :order_items, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :products, :reject_if => :all_blank, :allow_destroy => true

	after_save :update_product_price

	def update_product_price
		@products = Product.all
		@products.each do |p|
			p.set_price
		end
	end

	def payed_text 
		return 'Ja' if self.payed == true
		return 'Nej' if self.payed == false 
	end
end
