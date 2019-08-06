class Team < ApplicationRecord
	after_create :set_user_team

	def drifters
		@drifters ||= []
		self.users.each do |u|
			@drifters.push(User.find(u))
		end
		return @drifters
	end

	def purchases
		Purchase.where(team_id: self)
	end

	def purchases_grouped
		purchases.group_by(&:team_product).to_h
	end

	def total_purchases
		Purchase.where(team_id: self).includes(:product).sum(:price)
	end

	def order_items_grouped
		OrderItem.where(team_id: self).group(:product).sum(:quantity)
	end

	def total_orders
		Order.where(team_id: self).sum(:total)
	end

	private
	def set_user_team
		self.users.each do |u|
			user = User.find(u)
			user.set_team(self.id)
		end
	end
end
