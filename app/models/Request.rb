class Request < ApplicationRecord
	validates :comment, presence: true
	belongs_to :user

	def users
		User.all
	end

	def user
		if User.exists?(id: user_id)
			@user = users.find(user_id)
		end
	end
end
