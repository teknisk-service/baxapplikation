class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  helper_method :upvote
  helper_method :downvote

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

  def upvote
    @request = Request.find(params[:id])
    @request.upvote_by current_user
    redirect_to requests_url
  end

  def downvote
    @request = Request.find(params[:id])
    @request.downvote_by current_user
    redirect_to requests_url
  end
   private

   def request_params
        params.require(:request).permit(:user_id, :comment)
   end

   def set_request
    @request = Request.find(params[:id])
   end
end
