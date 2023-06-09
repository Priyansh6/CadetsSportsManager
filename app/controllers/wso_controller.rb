require 'set'
class WsoController < ApplicationController
  def index
    @competitions = Competition.all
  end
  def create_competition

    if params[:title] == "" or
      params[:competition_date] == "" or
      params[:location] == ""
      redirect_to "/wso/competitions/new", alert: "You need to specify all fields"
      return
    end

    @competition = Competition.create(title: params[:title],
                                       competition_date: params[:competition_date],
                                       location: params[:location])

    redirect_to "/wso/competitions/edit/%d" % @competition.id

  end

  def edit_competition
    @competition = Competition.find(params[:id])
  end

  def edit_competition_push
    if params[:title] == "" or
      params[:competition_date] == "" or
      params[:location] == ""
      redirect_to "/wso/competitions/edit/" + params[:id].to_s , alert: "You need to specify all fields"
      return
    end

    competition = Competition.find(params[:id])

    competition.update(competition_date: params[:competition_date],
                       title: params[:title],
                       location: params[:location])

    redirect_to "/wso/competitions/edit/%d" % competition.id, notice: "Successfully Changed"

  end

  def new_event
    competition = Competition.find(params[:id])

    if competition.single_event == true
      competition.update(single_event: false)
      events = Event.where(competition: competition)

      events.each do |e|
        CadetInterest.where(event: e).delete_all
        CadetRegistration.where(event: e).delete_all
      end
      events.delete_all
    end

  end
  def new_event_create
    AgeRange.where(competition_id: params[:id]).each do |ar|
      if params[ar.id.to_s] == "on"
        Event.create(title: params[:event_title],
                     competition_id: params[:id],
                     age_range: ar,
                     capacity: 1)
      end
    end
    redirect_to '/wso/competitions/edit/' + params[:id].to_s
  end

  def single_new_event_create

    competition = Competition.find(params[:id])

    if competition.single_event != true
      competition.update(single_event: true)
      events = Event.where(competition: competition)

      events.each do |e|
        CadetInterest.where(event: e).delete_all
        CadetRegistration.where(event: e).delete_all
      end
      events.delete_all
    end

    AgeRange.where(competition_id: params[:id]).each do |ar|
      if params[ar.id.to_s] == "on"
        current_event = Event.where(competition: competition,
                                    age_range: ar)
        if current_event.count == 0
          Event.create(title: competition.title,
                     competition: competition,
                     age_range: ar,
                     capacity: 1)
        end
      else
        current_event = Event.where(competition: competition,
                                    age_range: ar)
        if current_event.count != 0
          CadetRegistration.where(event: current_event).delete_all
          CadetInterest.where(event: current_event).delete_all
        end
        current_event.delete_all
      end
    end
    redirect_to '/wso/competitions/edit/' + params[:id].to_s
  end

  def create_age_range

    cutoff = params[:cutoff].to_date
    age = params[:max_age].to_i

    date_after = cutoff - age.years


    ar = AgeRange.create( competition_id: params[:id],
                          display_name: params[:display_name],
                          competing_category: params[:competing_category],
                          after: date_after,
                          before: Date.today)

    insert(ar)

  end

  def update_age_range

    ar = AgeRange.where(id: params[:cid]).first

    delete(ar)

    cutoff = params[:cutoff].to_date
    age = params[:max_age].to_i

    date_after = cutoff - age.years


    ar.update(display_name: params[:display_name],
              competing_category: params[:competing_category],
              after: date_after,
              before: Date.today)

    insert(ar)

  end

  def delete_age_range

    ar = AgeRange.where(id: params[:cid]).first

    delete(ar)

    events = Event.where(age_range: ar)

    events.each do |e|
      CadetInterest.where(event: e).delete_all
      CadetRegistration.where(event: e).delete_all
    end

    events.delete_all

    ar.delete

  end

  # assumes that ar is in the database DOES NOT ACTUALLY DELETE
  def delete (ar)
    ranges = AgeRange.where(competition: ar.competition, competing_category: ar.competing_category)
                     .order(before: :desc)

    last_before = ar.before
    cont = false

    ranges.each do |r|
      if cont
        r.update(before: last_before)
        return
      end
      if r.id == ar.id
        cont = true
      end
    end
  end

  # assumes that ar goes from Today - Actual after
  def insert (ar)
    ranges = AgeRange.where(competition: ar.competition, competing_category: ar.competing_category)
                     .where.not(id: ar.id)
                     .order(before: :desc)

    last = nil

    ranges.each do |r|
      if r.after < ar.after
        ar.update(before: r.before)
        r.update(before: ar.after - 1.day)
        return
      end
      last = r
    end

    if last != nil
      ar.update(before: last.after - 1.day)
    end
  end

  # def save_age_ranges
  #   # @competition = Competition.find(params[:id])
  #   @competition = Competition.where(id: params[:id]).first
  #   AgeRange.where(competition: @competition).delete_all
  #   n = params[:ranges_length].to_i
  #   rows = []
  #   competing_categories = Set.new
  #
  #   (2..n+1).each { |i|
  #     competing_category = params[("competing_cat_entry_" + i.to_s).to_sym]
  #     row = Row.new(params[("cat_name_entry_" + i.to_s).to_sym],
  #                   params[("competing_cat_entry_" + i.to_s).to_sym],
  #                   params[("max_age_entry_" + i.to_s).to_sym].to_i,
  #                   params[("cutoff_date_entry_" + i.to_s).to_sym].to_date)
  #     competing_categories << competing_category
  #     rows << row
  #   }
  #
  #   competing_categories.each do |cat|
  #     date_before = Date.today
  #     rows.select { |row| row.category == cat }.sort_by { |row| row.age }.each do |row|
  #       date_after = row.cutoff - row.age.years
  #       ar = AgeRange.create(competition: @competition,
  #                            before: date_before,
  #                            after: date_after,
  #                            display_name: row.name,
  #                            competing_category: row.category)
  #       date_before = date_after - 1.day
  #     end
  #   end
  #
  #
  # end
  #
  # private

end

# class Row
#   def initialize(name, category, age, cutoff)
#     @name = name
#     @category = category
#     @age = age
#     @cutoff = cutoff
#   end
#
#   attr_reader :name
#   attr_reader :category
#   attr_reader :age
#   attr_reader :cutoff
# end