class StaticPagesController < ApplicationController
  def home
  	@purchase = Purchase.new
    if current_user
  	 @user = current_user
  	 @purchases_grouped = @user.purchases_grouped
    end
  end

  def help
  end

  def admins
  	@admins = User.all.where(admin: true)
  end

end
