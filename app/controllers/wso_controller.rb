class WsoController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def new_competition
    @competition = Competition.new
  end

  def create_competition
    @competition = Competition.new(title: params[:title],
                                   competition_date: params[:competition_date],
                                   location: params[:location])

    if @competition.save
      redirect_to "/wso/competitions/edit/%d" % @competition.id
    else
      render :new_competition, status: :unprocessable_entity
    end
  end

  def edit_competition
    @competition = Competition.find(params[:id])
  end

  def edit_age_ranges
    @competition = Competition.find(params[:id])
  end

  def save_age_ranges
    @competition = Competition.find(params[:id])
    n = params[:ranges_length]
    (1..n).each { |i|
      age_range = AgeRange.new(competition: @competition,
                               competing_category: params[("competing_cat_entry_" + i).to_sym],
                               before: ,
                               after: ,
                               display_name: "something")
      age_range.save
    }
  end

  private

end
