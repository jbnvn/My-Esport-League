class TeamsController < ApplicationController
  before_action :set_league, only: [:create, :new, :destroy]
  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.league = @league
    @team.user = current_user
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def destroy
    @team.destroy
    redirect_to leagues_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :global_score)
  end

  def set_league
    @league = League.find(params[:league_id])
  end
end
