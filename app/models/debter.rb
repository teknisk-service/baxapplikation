class Debter < ApplicationRecord
	belongs_to :outlay
	belongs_to :user
	accepts_nested_attributes_for :user, :reject_if => :all_blank
	after_create :set_team

	def payed_text
		return 'Ja' if self.payed == true
		return 'Nej' if self.payed == false
	end

	private
  	def set_team
    	team = SessionsController.helpers.current_team
    	update_attribute(:team_id, team.id)
  	end
end
