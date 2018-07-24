class StaticPagesController < ApplicationController
  def home
  	@purchase = Purchase.new
    @users = User.all.sort_by(&:debt).reverse
    if current_user
  	 @user = current_user
  	 @purchases_grouped = @user.purchases_grouped
     @last_purchase = @user.purchases.first
     @purchases_stats = Purchase.where(:user_id=> 1).joins(:product).group('products.name').count
    end
  end

  def help
  end

  def admins
  	@admins = User.all.where(admin: true)
  end

end
