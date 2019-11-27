class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(params.permit(:user_id, :league_id))
    @participation.save
  end
end
