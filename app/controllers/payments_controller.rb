class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
    @total_in = Payment.all.sum(:amount)
    @total_out = Order.all.sum(:total)
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        flash[:notice] = "Betalning registrerad!"
        format.html { redirect_to :controller => 'payments', :action => 'new', notice: 'Betalningen är registrerad.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def authorize
      unless current_user.admin?
        redirect_to root_path, notice: 'Det är bara Baxmor som får vara där!'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :user_id)
    end
end
