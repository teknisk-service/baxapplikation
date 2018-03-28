class WhitelistsController < ApplicationController

	def new
		@whitelist = Whitelist.new
	end

	def create
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
		@whitelist.destroy
		redirect_to whitelists_url, notice: 'Mailadress borttagen'
	end

	private

	def whitelist_params
		params.require(:whitelist).permit(:email)
	end
end
