class Team < ApplicationRecord
	after_create :set_user_team

	def drifters
		@drifters ||= []
		self.users.each do |u|
			@drifters.push(User.find(u))
		end
		return @drifters
	end

	private
	def set_user_team
		self.users.each do |u|
			user = User.find(u)
			user.set_team(self.id)
		end
	end
end
