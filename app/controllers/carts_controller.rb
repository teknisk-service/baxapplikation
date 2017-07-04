class CartsController < ApplicationController
	def index
		@carts = Cart.all 
	end

	def show
		@cart_item = @cart.cart_items
	end

	def new
		@cart = Cart.new
		get_products
	end

	def edit
		get_products
	end

	def create
		@cart = Cart.new(cart_params)
		
		params[:products][:id].each do |p|
			if !p.empty? 
				@cart.cart_items.build(:product_id => p)
			end
		end

		if @cart.save
			redirect_to @cart
		else
			render 'new'
		end
		
	end

	def update
		respond_to do |format|
			if @cart.update(cart_params)
				@cart.products = []
				params[:products][:id].each do |p|
					if !p.empty?
						@cart.products << Product.find(p)
					end
				end
				format.html { redirect_to @cart, notice: 'Author was successfully updated.' }
				format.json { render :show, status: :ok, location: @cart }
			else
				format.html { render :edit }
				format.json { render json: @cart.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		flash[:success] = "Inköp borttaget"
		redirect_to carts_url
	end

	private
	def set_cart
		@cart = Cart.find(params[:id])
	end

	def cart_params
		params.require(:cart).permit(:date, :mammerist)
	end	

	def get_products
		@all_products = Product.all 
		@cart_item = @cart.cart_items.build
	end
end

