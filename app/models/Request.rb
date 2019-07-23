class Request < ApplicationRecord
	acts_as_votable
	validates :comment, presence: true
	belongs_to :user
	after_create :set_team

	def users
		User.all
	end

	def user
		if User.exists?(id: user_id)
			@user = users.find(user_id)
		end
	end

	private
	def set_team
		team = SessionsController.helpers.current_team
		update_attribute(:team_id, team.id)
  	end
end
