class SharedPurchasesController < ApplicationController
	def index
		@shared_purchases = SharedPurchase.all
	end

	def new 
		@shared_purchase = SharedPurchase.new
	end

	def create
		@shared_purchase = SharedPurchase.new(shared_purchases_params)
		if @shared_purchase.save!
			redirect_to :controller => 'shared_purchases', :action => 'index'
		else
			render 'new'
		end
		Payment.create(amount: @shared_purchase.price, user_id: current_user.id)
	end

	private
	def shared_purchases_params
		params.require(:shared_purchase).permit(:name, :price)
	end

	def set_shared_purchase
		@shared_purchase = shared_purchase.find(params[:id])
	end
end
