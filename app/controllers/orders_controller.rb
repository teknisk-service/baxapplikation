class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to edit_order_path(@order), notice: 'Inköp tillagt'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to edit_order_path(@order), notice: 'Inköp uppdaterat'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Inköp borttaget'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:total, :date, :mammerist, order_items_attributes: [:id, :_destroy, :product_id, :quantity, product_attributes: [:id, :_destroy, :name]])
    end
end