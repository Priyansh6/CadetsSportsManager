class WsoController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(title: params[:title],
                                   competition_date: params[:competition_date],
                                   location: params[:location])

    if @competition.save
      redirect_to "/wso/competitions/%d" % @competition.id
    else
      render :new, status: :unprocessable_entity
    end
  end
end
