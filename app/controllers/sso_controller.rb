class SsoController < ApplicationController
  def competitions
    @competitions = Competition.all
  end

  def competition_page
    @competition = Competition.where(id: params[:compid]).first
    @events = Event.all.where(competition: @competition)
  end

end
