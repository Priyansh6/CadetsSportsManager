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
    @registered = CadetRegistration.joins(:cadet).where(event: @event).where(cadet: {squadron_id: 1})
    @interested = CadetInterest.joins(:cadet).where(event: @event)
                               .where(cadet: {squadron_id: 1})
                               .where.not(cadet_id: @registered.select(:cadet_id)).distinct
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

  def unregister_cadet
    CadetRegistration.where(event_id: params[:eid], cadet_id: params[:cid]).first.delete
  end

  def uninterested_cadet
    CadetInterest.where(event_id: params[:eid], cadet_id: params[:cid]).first.delete
  end

  def register_cadet
    CadetRegistration.create(cadet_id: params[:cid],
                             event_id: params[:eid])
  end

  def interested_cadet
    CadetInterest.create(cadet_id: params[:cid],
                             event_id: params[:eid])
  end

  def cadets
    @cadets = Cadet.where(squadron_id: 1).order(created_at: :desc)
  end

  def cadet_create

    Cadet.create(squadron_id: 1,
                 firstname: params[:firstname],
                 lastname: params[:lastname],
                 dob: params[:dob],
                 cid: params[:cid],
                 rank: params[:rank],
                 competing_category: params[:competing_category])

  end

  def cadet_update
    c = Cadet.where(id: params[:cid]).first

    c.update(firstname: params[:firstname],
                 lastname: params[:lastname],
                 dob: params[:dob],
                 cid: params[:caid],
                 rank: params[:rank],
                 competing_category: params[:competing_category])
  end

  def cadet_delete
    c = Cadet.where(id: params[:cid]).first
    CadetRegistration.where(cadet: c).delete_all
    CadetInterest.where(cadet: c).delete_all
    c.delete
  end


end
