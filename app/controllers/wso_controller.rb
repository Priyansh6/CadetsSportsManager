require 'set'
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

  def new_event_create
    redirect_to '/wso/competitions/edit/' + params[:id].to_s

    AgeRange.where(competition_id: params[:id]).each do |ar|
      if params[ar.id.to_s] == "on"
        Event.create(title: params[:event_title],
                     competition_id: params[:id],
                     age_range: ar,
                     capacity: 1)
      end
    end

  end

  def save_age_ranges
    # @competition = Competition.find(params[:id])
    @competition = Competition.where(id: params[:id]).first
    AgeRange.where(competition: @competition).delete_all
    n = params[:ranges_length].to_i
    rows = []
    competing_categories = Set.new

    (2..n+1).each { |i|
      competing_category = params[("competing_cat_entry_" + i.to_s).to_sym]
      row = Row.new(params[("cat_name_entry_" + i.to_s).to_sym],
                    params[("competing_cat_entry_" + i.to_s).to_sym],
                    params[("max_age_entry_" + i.to_s).to_sym].to_i,
                    params[("cutoff_date_entry_" + i.to_s).to_sym].to_date)
      competing_categories << competing_category
      rows << row
    }

    competing_categories.each do |cat|
      date_before = Date.today
      rows.select { |row| row.category == cat }.sort_by { |row| row.age }.each do |row|
        date_after = row.cutoff - row.age.years
        ar = AgeRange.create(competition: @competition,
                             before: date_before,
                             after: date_after,
                             display_name: row.name,
                             competing_category: row.category)
        date_before = date_after - 1.day
      end
    end


  end

  private

end

class Row
  def initialize(name, category, age, cutoff)
    @name = name
    @category = category
    @age = age
    @cutoff = cutoff
  end

  attr_reader :name
  attr_reader :category
  attr_reader :age
  attr_reader :cutoff
end