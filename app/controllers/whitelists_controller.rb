class WhitelistsController < ApplicationController

	def new
		head :forbidden unless authorize
		@whitelist = Whitelist.new
	end

	def create
		head :forbidden unless authorize
		@whitelist = Whitelist.new(whitelist_params)
		if @whitelist.save! 
			redirect_to :controller => 'whitelists', :action => 'index'
		else
			render 'new'
		end
	end

	def index
		@whitelists = Whitelist.all
	end

	def destroy
		head :forbidden unless authorize
		@whitelist.destroy
		redirect_to whitelists_url, notice: 'Mailadress borttagen'
	end

	private

	def whitelist_params
		params.require(:whitelist).permit(:email)
	end

	def authorize
		unless current_user.admin?
			redirect_to root_path, notice: 'Det är bara Baxmor som får vara där!'
		end
	end
end
