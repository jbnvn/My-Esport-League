class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :destroy]
  # def show
  # end

  # def new
  # end

  def create
  # Validate my bets if all players are chosen
  # Validate my best. turn all players status into pending
  # Check if all partcipants players are pending
  # Compare points by players
  # If points higher are alone turn player status into validate
  # Else turn players status into failed
  # If all players validate then go into 'wait for others to finish mercato'
  # Else go to round 2
  # Round 2: remove all players chosen and chose from roles you don't have
  # go back to first step until all partcipants validate step 7
  # When all validate step seven go to controller of rounds
  raise
  end

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

  def set_bid
    @bid = Bid.find(params[:id])
  end
end
