class TeamsController < ApplicationController
  before_action :set_league, only: [:create, :new, :destroy]

  def index
    @teams = League.find(params[:league_id]).teams
    @games = @teams.each_slice(2).to_a
  end

  def show
    @team = Team.find(params[:id])
    @bid = Bid.new
    @players = Player.all
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

  def show_post_mercato
    @team = Team.find(params[:id])
    @bid = Bid.new
    @players = Player.all
  end

  private

  def team_params
    params.require(:team).permit(:name, :global_score, :user_id)
  end

  def set_league
    @league = League.find(params[:league_id])
  end
end
