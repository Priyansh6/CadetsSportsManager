Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount ActionCable.server => '/cable'

  root 'wso#index'

  get "/wso", to: "wso#index"
  get "/wso/competitions/new", to: "wso#new_competition"
  get "/wso/competitions/new-event/:id", to: "wso#new_event"
  get "/wso/competitions/edit/:id", to: "wso#edit_competition"
  get "/wso/competitions/:id/age-ranges/edit", to: "wso#edit_age_ranges"

  post "/wso/competitions/new-event-create/:id", to: "wso#new_event_create"
  post "/wso/competitions/create", to: "wso#create_competition", as: :competitions_path
  post "/wso/competitions/edit-push/:id", to: "wso#edit_competition_push"
  #post "/wso/competitions/:id/age-ranges/save", to: "wso#save_age_ranges"
  post "/wso/competitions/single-new-event-create/:id", to: "wso#single_new_event_create"

  post '/wso/age-range-create/:id', to: 'wso#create_age_range'
  post '/wso/age-range-update/:cid/:id', to: 'wso#update_age_range'
  post '/wso/age-range-delete/:cid/:id', to: 'wso#delete_age_range'

  get '/sso/competitions', to: 'sso#competitions'
  get '/sso/:compid/events', to: 'sso#competition_page'
  get '/sso/:compid/events', to: 'sso#competition_page'
  get '/sso/:compid/events-first', to: 'sso#competition_page_first'
  get '/sso/:compid/events-second', to: 'sso#competition_page_second_one'
  get '/sso/:compid/events-second/:aid', to: 'sso#competition_page_second_two'
  get '/sso/:compid/events-third', to: 'sso#competition_page_third'


  get '/sso/event/:eid', to: 'sso#event_page'
  get '/sso/event-bad/:eid', to: 'sso#event_page_bad'
  get '/sso/cadets', to: 'sso#cadets'

  post '/sso/unregister-cadet/:eid/:cid', to: "sso#unregister_cadet"
  post '/sso/uninterested-cadet/:eid/:cid', to: "sso#uninterested_cadet"
  post '/sso/register-cadet/:eid/:cid', to: "sso#register_cadet"
   post '/sso/interested-cadet/:eid/:cid', to: "sso#interested_cadet"
  post '/sso/cadet-create/', to: 'sso#cadet_create'
  post '/sso/cadet-update/:cid', to: 'sso#cadet_update'
  post '/sso/cadet-delete/:cid', to: 'sso#cadet_delete'

  get '/cadet/', to: 'cadets#competitions_my_events_calender'
  get '/cadet/competitions', to: 'cadets#competitions'
  get '/cadet/competitions-my-events', to: 'cadets#competitions_my_events'
  get '/cadet/competitions-my-events-calender', to: 'cadets#competitions_my_events_calender'
  get '/cadet/:cid/events-bad', to: 'cadets#competition_page_bad'
  get '/cadet/:cid/events', to: 'cadets#competition_page'
  get '/cadet/:cid/events-friend', to: 'cadets#competition_page_friend'
  get '/cadet/:cid/events-friend-bad', to: 'cadets#competition_page_friend_bad'
  get '/cadet/my-events', to: 'cadets#my_events'

  post '/cadet/clear-seen/:cid', to: 'cadets#clear_seen'
  post '/cadet/interested-cadet/:eid/:cid', to: "cadets#interested_cadet"
  post '/cadet/uninterested-cadet/:eid/:cid', to: "cadets#uninterested_cadet"



end
