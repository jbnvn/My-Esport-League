class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  def index
    @leagues = League.all
    @league = League.new
    @new_team = Team.new
  end

  def leaderboard
    @league = params[:league_id] ? League.find(params[:league_id]) : League.find(params[:id])

    @teams = @league.teams
    @sort_team = League.find(1).teams.sort_by { |t| t.compute_points }.reverse
  end

  def show
    @new_team = Team.new
    if params[:search].blank?
      "Empty field!"
    else
      @parameter = params[:search]
      @users = User.all.where("username LIKE :search", search: "%#{@parameter}%")
    end
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.creator = current_user
    if @league.save
      redirect_to league_path(@league)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @league.update(league_params)
      redirect_to @league
    else
      render 'edit'
    end
  end

  def destroy
    @league.destroy
    redirect_to leagues_path
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
