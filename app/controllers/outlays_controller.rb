class OutlaysController < ApplicationController
	before_action :set_outlay, only: [:show, :edit, :update, :destroy]

	def index
		@outlays = Outlay.all
	end

	def show
	end

	def new
		@outlay = Outlay.new
	end

	def edit
	end

	def create
		@outlay = Outlay.new(outlay_params)
		if @outlay.save
			redirect_to edit_outlay_path(@outlay), notice: 'Utlägg tillagt'
		else
			render :new
		end
	end

	def update
		if @outlay.update(outlay_params)
			redirect_to edit_outlay_path(@outlay), notice: 'Utlägg uppdaterat'
		else
			render :edit
		end
	end

	def destroy
		@outlay.destroy
		redirect_to outlays_url, notice: 'Utlägg borttaget'
	end

	private
	def set_outlay
      @outlay = Outlay.find(params[:id])
    end

	def outlay_params
		params.require(:outlay).permit(:sum, :description, debters_attributes: [:id, :_destroy, :user_id, :amount, :payed, user_attributes: [:id, :_destroy, :name]])
	end
end
