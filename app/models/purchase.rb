class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true

  def products
  	@products = Product.all
  end

  def product
  	@product = products.find(product_id)
  end
end
