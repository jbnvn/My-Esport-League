class LeaguesController < ApplicationController
  before_action :set_league, only: [:show]
  
  def index
    @leagues = League.all

  def show
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user
    if @league.save
      redirect_to league_path(@league)
    else
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
