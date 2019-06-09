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
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(team_params)
	end

	def create
		@team = Team.new(team_params)
		if @team.save!
			redirect_to :controller => 'teams', :action => 'index'
		else
			render 'new'
		end
	end

	def update
		if @team.update(team_params)
			redirect_to edit_team_path(@team), notice: 'Team uppdaterat'
		else
			render :edit
		end
	end

	def destroy
		@team.destroy
		redirect_to teams_url, notice: 'Team borttaget'
	end

	private
	def team_params
		params.require(:team).permit(:year, :active, :users)
	end

	def set_team
      @team = Team.find(params[:id])
    end
end


