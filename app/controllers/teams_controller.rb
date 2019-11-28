class TeamsController < ApplicationController
  before_action :set_league, only: [:create, :new, :destroy]
  def show
    @team = Team.find(params[:id])
#Construire la page pour un role
#Button validate formulaire on peut lier le submit et son formulaire avec l id "for"
#Creer un formulaire de bids qui va taper create de bids avec deux inputs l'id du player et son prix
  @bid = Bid.new

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
