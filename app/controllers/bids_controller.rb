class BidsController < ApplicationController
  before_action :set_team, only: [:create]
  # def show
  # end

  # def new
  # end

  def create
    # Validate my bets if all players are chosen
    # Validate my best. turn all players status into pending
  # Check if all partcipants players are pending
  # Compare points by players(half of it done)
  # If points higher are alone turn player status into validate(half of it done)
  # Else turn players status into failed(half of it done)
  # If all players validate then go into 'wait for others to finish mercato'
  # Else go to round 2
    params[:bid][:player_id].select{ |p| p != "" }.each_with_index do |player_id, index|
      bid = Bid.new()
      bid.team = @team
      bid.player_id = player_id

      bid.status ="pending"
      case index
      when 0 then bid.points = params[:bid][:top_points]
      when 1 then bid.points = params[:bid][:jun_points]
      when 2 then bid.points = params[:bid][:mid_points]
      when 3 then bid.points = params[:bid][:adc_points]
      when 4 then bid.points = params[:bid][:sup_points]
      when 5 then bid.points = params[:bid][:all_points]
      end
      bid.save
    end

    # autres équipes
    #if !(@team.league.teams.count * 6 == @team.league.bids.succeeded.count)
      if @team.league.teams.count * 6 == @team.league.bids.pending.count
        @team.league.players.each do |player|
          player_bids = player.bids.where(team: @team.league.teams).order(points: :desc)
          player_bids.first.succeeded!
          player_bids[1..-1].each{ |pb| pb.failed! }
        end
          redirect_to show_post_mercato_path(@team)

  #     elsif @team.league.teams.count * 6 == @team.league.bids.pending.count + @team.league.bids.succeeded.count
  #       @team.league.players.each do |player|
  #         player_bids = player.bids.where(team: @team.league.teams).order(points: :desc)
  #         player_bids.first.succeeded!
  #         player_bids[1..-1].each{ |pb| pb.failed! }
  #       end
  #       if @team.league.teams.count * 6 == @team.league.bids.succeeded.count
  #         redirect_to show_post_mercato_path(@team)

        end
  #     end
  #       redirect_to team_path(@team)
  #   #else
   end
  # Round 2: remove all players chosen and chose from roles you don't have
    # if @team.league.bids.failed == 0
    # redirect to show_post_mercato
    # else redirect to show team
    # if first bid has been made change the condition of validation
    # condition of validation : if @team.league.teams.count * 6 == @team.league.bids.pending.count + @team.league.bids.succeeded.count



  # go back to first step until all partcipants validate step 7
  # When all validate step seven go to controller of rounds


  # def edit
  # end

  # def update
  # end

  def destroy
  end

  private

  def bid_params
    params.require(:bid).permit(:status, :points)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
