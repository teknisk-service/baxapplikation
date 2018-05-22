class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all.order(:comment)
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
   @request = Request.new(request_params)
   if @request.save!
      redirect_to :controller => 'requests', :action => 'index'
    else
      render 'new'
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_url, notice: 'Önskning borttagen'
  end

   private

   def request_params
        params.require(:request).permit(:user_id, :comment)
   end

   def set_request
    @request = request.find(params[:id])
   end
end
