class OrderItemsController < ApplicationController
	def create
		@shopping = current_shopping
		@order_item = @shopping.order_items.new(order_item_params)
		@shopping.save
		session[:order_id] = @shopping.id
	end

	def update
		@shopping = current_shopping
		@order_item = @shopping.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @shopping.order_items
	end

	def destroy
		@shopping = current_shopping
		@order_item = @shopping.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @shopping.order_items
	end

private
	def order_item_params
		params.require(:order_item).permit(:quantity, :product_id)
	end
end
