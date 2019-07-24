class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  accepts_nested_attributes_for :product, :reject_if => :all_blank
  after_create :set_team

  def products
    team = SessionsController.helpers.current_team
  	@products = Product.where(team_id: team.id)
  end

  private
  def set_team
    team = SessionsController.helpers.current_team
    update_attribute(:team_id, team.id)
  end
end
