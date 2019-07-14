class Team < ApplicationRecord
	serialize :users

	def drifters
		@drifters ||= []
		self.users.each do |u|
			@drifters.push(User.find(u))
		end
		return @drifters
	end
end
