class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :destroy]
  # def show
  # end

  # def new
  # end

  def create
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
