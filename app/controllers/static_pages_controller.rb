class StaticPagesController < ApplicationController
  def home
    team = SessionsController.helpers.current_team
    active = User.where('teams && ARRAY[?]::varchar[]', [team.id])
  	@purchase = Purchase.new
    @users = active.sort_by(&:debt).reverse
    if current_user
  	 @user = current_user
  	 @purchases_grouped = @user.purchases_grouped
     @last_purchase = @user.purchases.first
     @purchases_stats = Purchase.where(user: current_user).where(team_id: team.id)
      .joins(:product)
      .group('products.name')
      .count
      .sort_by(&:last)
      .to_h
     @money_spent = Purchase.where(user: current_user).where(team_id: team.id)
      .includes(:product)
      .group('products.name')
      .sum(:price)
      .sort_by(&:last)
      .to_h
     @count = @purchases_stats.values.size
    end
  end

  def help
  end

  def admins
  	@admins = User.all.where(admin: true)
  end

end
