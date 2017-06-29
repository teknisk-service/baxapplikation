class ShoppingsController < ApplicationController

  def index
    @shoppings = Shopping.all
    @total_out = Shopping.all.sum(:sum)
  end

  def show
  end

  def new
    @shopping = Shopping.new
  end

  def edit
  end

  def create
    @shopping = Shopping.new(shopping_params)

    respond_to do |format|
      if @pshopping.save
        flash[:notice] = "Inköp registrerat!"
        format.html { redirect_to :controller => 'shoppings', :action => 'new', notice: 'Inköpet registrerat' }
        format.json { render :show, status: :created, location: @shopping }
      else
        format.html { render :new }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shopping.update(shopping_params)
        format.html { redirect_to @shopping, notice: 'Inköp uppdaterat.' }
        format.json { render :show, status: :ok, location: @shopping }
      else
        format.html { render :edit }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Inköpet borttaget.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end

    def authorize
      unless current_user.admin?
        redirect_to root_path, notice: 'Det är bara Baxmor som får vara där!'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_params
      params.require(:payment).permit(:sum, :description, :mammerist)
    end
end
