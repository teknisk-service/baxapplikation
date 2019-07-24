class Payment < ApplicationRecord
  belongs_to :user
  after_create :set_team

  def total_in
  	Payment.sum(:amount)
  end

  private
  def set_team
    team = SessionsController.helpers.current_team
    update_attribute(:team_id, team.id)
  end
end
