class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :tasks, allow_destroy: true
end
