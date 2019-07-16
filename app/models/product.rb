class Product < ApplicationRecord
  validates :name, presence: true

  has_many :purchases
  has_many :orders, through: :order_items
  has_many :order_items, inverse_of: :product

  after_create :set_team

  def product_price
    if total_quantity > 0
      OrderItem.where(product: self).sum(:price).to_f / total_quantity
    else
      0
    end
  end

  def set_price
  	@price = self.product_price
  	update_attribute(:price, @price)
  end

  def total_quantity
    OrderItem.where(product: self).sum(:quantity)
  end

  private
  def set_team
    team = SessionsController.helpers.current_team
    update_attribute(:team_id, team.id)
  end
end
