class CartsController < ApplicationController
	def index
		@carts = Cart.all 
	end

	def new
		@cart = Cart.new
	end	

	def create
		@cart = Cart.new(cart_params)
		if @project.save
			flash[:notice] = 'Inköp skapat'

			redirect_to carts_path
		else
			render :new
		end
	end

	def update
		@cart = Cart.find(params[:id])  
		if @cart.update_attributes(cart_params)
			redirect_to @cart, notice: 'Uppdaterade inköp'
		else
			render :edit
		end
	end

	private
	def cart_params
		params.require(:cart).permit(:date, :mammerist)
	end	
end

