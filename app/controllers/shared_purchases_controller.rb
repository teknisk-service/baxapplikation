class SharedPurchasesController < ApplicationController
	def index
		team = SessionsController.helpers.current_team
		@shared_purchases = SharedPurchase.where(team_id: team.id)
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

	def destroy
    @shared_purchase = SharedPurchase.find(params[:id])
    @shared_purchase.destroy
    flash[:success] = "Gemensamt köp borttagen"
    redirect_to shared_purchases_url
  end

	private
	def shared_purchases_params
		params.require(:shared_purchase).permit(:name, :price)
	end

	def set_shared_purchase
		@shared_purchase = shared_purchase.find(params[:id])
	end
end
