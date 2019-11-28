class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
  end

  def create
    if Participation.where(user_id: params[:user_id], league_id: params[:league_id]).exists?
      redirect_to leagues_path
    else
      @participation = Participation.new(params.permit(:user_id, :league_id))
      @participation.save
    end
  end
end
