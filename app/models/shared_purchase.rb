class SharedPurchase < ApplicationRecord
	after_create :set_team

	private
	def set_team
		team = SessionsController.helpers.current_team
		update_attribute(:team_id, team.id)
  	end
end
