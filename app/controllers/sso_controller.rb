class SsoController < ApplicationController
  def competitions
    @competitions = Competition.all
  end

  def competition_page
    @competition = Competition.where(id: params[:compid]).first
    @events = Event.all.where(competition: @competition)
  end

  def event_page
    @event = Event.where(id: params[:eid]).first
    @registered = CadetRegistration.where(event: @event)
    @interested = CadetInterest.where(event: @event)
    @date_range = @event.age_range.before..@event.age_range.after
    @available  = Cadet.where(squadron_id: 1)
                   .where(dob: @date_range)
                   .where(competing_category: @event.age_range.competing_category)
                   .where.not(id: @interested.select(:cadet_id)).distinct
                   .where.not(id: @registered.select(:cadet_id)).distinct

  end

  def event_page_bad
    @event = Event.where(id: params[:eid]).first
  end

end
