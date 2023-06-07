class CompetitionsController < ApplicationController
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
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to @competition
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def competition_params
    params.require(:competition).permit(:title, :competition_date, :location)
  end
end
