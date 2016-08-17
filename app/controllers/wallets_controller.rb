class WalletsController < ApplicationController
  def show
  	@wallet = Wallet.find(params[:id])
  end

  def index
  	@wallets = current_user.wallets
  end

  def add(product_id) 
  	 id = params[:id] 
    wallet[id] ? wallet[id] = wallet[id] + 1 : wallet[id] = 1 
    flash[:notice] = "Added to walet"
    redirect_to :back
  end

  def total
  	products.sum(&:price)
  end

  
  
end
