class TeamsController < ApplicationController
	def index
		@teams = Team.all.sort_by(&:year)
	end

	def show
		@team = Team.find(params[:id])
	end

	def new
		@team = Team.new
	end

	def edit
		head :forbidden unless authorize
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(team_params)
		@team.users = params[:team][:users]
		if @team.save!
			redirect_to :controller => 'teams', :action => 'index'
		else
			render 'new'
		end
	end

	def update
		head :forbidden unless authorize
		@team = Team.find(params[:id])
		if @team.update(team_params)
			flash[:success] = "Drifveri uppdaterat"
			redirect_to @team
		else
			render 'edit'
		end
	end

	def destroy
		@team.destroy
		redirect_to teams_url, notice: 'Team borttaget'
	end

	def stats
		team = Team.find(params[:id])
		@purchases_grouped = team.purchases_grouped
		@total_purchases = team.total_purchases
		@order_items = team.order_items_grouped
		@total_orders = team.total_orders
	end

	private
	def team_params
		params.require(:team).permit(:year, :active, :users => [])
	end

	def set_team
		@team = Team.find(params[:id])
	end

	def authorize
      current_user.admin?
    end
end


