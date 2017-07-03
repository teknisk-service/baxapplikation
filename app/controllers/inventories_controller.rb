class InventoriesController < ApplicationController
	def show
	end

	def new
		@inventory = Inventory.new
	end

	def edit
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def create
		@inventory = Inventory.new(inventory_params)
		if @inventory.save
			flash[:success] = "Lager skapat"
			redirect_to @inventory
		else
			render 'new'
		end
	end

	def destroy
		@inventory.destroy
		flash[:success] = "Inventory removed"	
		redirect_to inventory_url
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
    	params.require(:inventory).permit(:total)
    end
end
