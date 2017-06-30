class Shopping < ApplicationRecord
	validates :sum, presence: true
  	validates :description, presence: true
  	validates :mammerist, presence: true

	has_many :order_items
	before_save :update_subtotal

	def subtotal
		order_items.collect { |oi| oi.valid ? (oi.quantity * oi.unit_price) : 0}.sum
	end

	private
	def update_subtotal
		self[:subtotal] = subtotal
	end
end
