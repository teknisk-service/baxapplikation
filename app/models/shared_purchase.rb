class SharedPurchase < ApplicationRecord
	after_create :set_team

	private
	def set_team
		current_team.add_shared_purchase(self.id)
	end
end
