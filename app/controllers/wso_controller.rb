class WsoController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show_competition
    @competition = Competition.find(params[:id])
  end

  def new_competition
    @competition = Competition.new
  end

  def create_competition
    @competition = Competition.new(title: params[:title],
                                   competition_date: params[:competition_date],
                                   location: params[:location])

    if @competition.save
      redirect_to "/wso/competitions/%d" % @competition.id
    else
      render :new_competition, status: :unprocessable_entity
    end
  end

  def edit_competition
    @competition = Competition.find(params[:id])
  end
end
