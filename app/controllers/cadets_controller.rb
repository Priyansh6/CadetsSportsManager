class CadetsController < ApplicationController
  def competitions
    @competitions = Competition.all
  end

  def competitions_my_events
    @competitions = Competition.all
  end

  def competitions_my_events_calender
    @competitions = Competition.all
  end

  def clear_seen
    Notification.where(cadet_id: params[:cid], seen: false).update(seen: true)
  end

  def competition_page_bad
    @cadet = Cadet.where(id: 1).first

    @competition = Competition.where(id: params[:cid]).first
    @events = Event.all.where(competition: @competition)
  end

  def competition_page
    @cadet = Cadet.where(id: 1).first
    @competition = Competition.where(id: params[:cid]).first
    @events = Event.all.where(competition: @competition)
  end

  def competition_page_friend
    @cadet = Cadet.where(id: 1).first
    @competition = Competition.where(id: params[:cid]).first
    @events = Event.all.where(competition: @competition)
  end

  def competition_page_friend_bad
    @cadet = Cadet.where(id: 1).first
    @competition = Competition.where(id: params[:cid]).first
    @events = Event.all.where(competition: @competition)
  end

  def my_events
    @cadet = Cadet.where(id: 1).first
    @registered_events = Event.where(id: CadetRegistration.where(cadet_id: 1).select(:event_id))
    @interested_events = Event.where(id: CadetInterest.where(cadet_id: 1).select(:event_id)).where.not(id: @registered_events.select(:id))
  end


  #
  # def event_page
  #   @event = Event.where(id: params[:eid]).first
  #   @registered = CadetRegistration.joins(:cadet).where(event: @event).where(cadet: {squadron_id: 1})
  #   @interested = CadetInterest.joins(:cadet).where(event: @event)
  #                              .where(cadet: {squadron_id: 1})
  #                              .where.not(cadet_id: @registered.select(:cadet_id)).distinct
  #   @date_range = @event.age_range.after...@event.age_range.before
  #   @available  = Cadet.all
  #                      .where(dob: @date_range)
  #                      .where(competing_category: @event.age_range.competing_category)
  #                      .where.not(id: @interested.select(:cadet_id))
  #                      .where.not(id: @registered.select(:cadet_id)).distinct
  #
  # end
  #
  # def event_page_bad
  #   @event = Event.where(id: params[:eid]).first
  # end
  #
  # def unregister_cadet
  #   CadetRegistration.where(event_id: params[:eid], cadet_id: params[:cid]).first.delete
  # end
  #
  def uninterested_cadet
    CadetInterest.where(event_id: params[:eid], cadet_id: params[:cid]).first.delete
  end
  #
  # def register_cadet
  #   CadetRegistration.create(cadet_id: params[:cid],
  #                            event_id: params[:eid])
  # end
  #
  def interested_cadet
    CadetInterest.create(cadet_id: params[:cid],
                         event_id: params[:eid])
  end
  #
  # def cadets
  #   @cadets = Cadet.where(squadron_id: 1).order(created_at: :desc)
  # end
  #
  # def cadet_create
  #
  #   Cadet.create(squadron_id: 1,
  #                firstname: params[:firstname],
  #                lastname: params[:lastname],
  #                dob: params[:dob],
  #                cid: params[:cid],
  #                rank: params[:rank],
  #                competing_category: params[:competing_category])
  #
  # end
  #
  # def cadet_update
  #   c = Cadet.where(id: params[:cid]).first
  #
  #   c.update(firstname: params[:firstname],
  #            lastname: params[:lastname],
  #            dob: params[:dob],
  #            cid: params[:caid],
  #            rank: params[:rank],
  #            competing_category: params[:competing_category])
  # end
  #
  # def cadet_delete
  #   c = Cadet.where(id: params[:cid]).first
  #   CadetRegistration.where(cadet: c).delete_all
  #   CadetInterest.where(cadet: c).delete_all
  #   c.delete
  # end


end
