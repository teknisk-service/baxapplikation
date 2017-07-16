class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  accepts_nested_attributes_for :product, :reject_if => :all_blank

  def products
  	@products = Product.all
  end
end
