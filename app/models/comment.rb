class Comment < ApplicationRecord
	validates :comment, presence: true
	belongs_to :user

	def users
		User.all
	end

	def user 
		@user = users.find(user_id)
	end
end
