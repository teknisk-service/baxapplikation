class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true

  after_create :set_team

  def products
    team = SessionsController.helpers.current_team
  	@products = Product.where(team_id: team.id)
  end

  def team_product
    if team_id
      Product.where(team_id: team_id).find(product_id)
    end
  end

  def product
    if product_id
  	 @product = products.find(product_id)
    end
  end

  private
  def set_team
    team = SessionsController.helpers.current_team
    update_attribute(:team_id, team.id)
  end
end
