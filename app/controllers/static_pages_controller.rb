class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def admins
  	@admins = User.all.where(admin: true)
  end

end
