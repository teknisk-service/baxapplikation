class Cart < ApplicationRecord
	has_many :cart_items, inverse_of: :cart
	has_many :products

	accepts_nested_attributes_for :cart_items, reject_if: proc { |a| a[:date].blank?}, allow_destroy: true
end
