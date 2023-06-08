Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'wso#index'

  get "/wso", to: "wso#index"
  get "/wso/competitions/new", to: "wso#new_competition"
  get "/wso/competitions/new-event", to: "wso#new_event"
  post "/wso/competitions/create", to: "wso#create_competition", as: :competitions_path
  get "/wso/competitions/edit/:id", to: "wso#edit_competition"
  get "/wso/competitions/:id/age-ranges/edit", to: "wso#edit_age_ranges"
  post "/wso/competitions/:id/age-ranges/save", to: "wso#save_age_ranges"

  get '/sso/competitions', to: 'sso#competitions'
  get '/sso/:compid/events', to: 'sso#competition_page'
  get '/sso/event/:eid', to: 'sso#event_page'
  get '/sso/event-bad/:eid', to: 'sso#event_page_bad'
  get 'sso/cadets', to: 'sso#cadets'

  post '/sso/unregister-cadet/:eid/:cid', to: "sso#unregister_cadet"
  post '/sso/uninterested-cadet/:eid/:cid', to: "sso#uninterested_cadet"
  post '/sso/register-cadet/:eid/:cid', to: "sso#register_cadet"
  post '/sso/interested-cadet/:eid/:cid', to: "sso#interested_cadet"
  post '/sso/cadet-create/', to: 'sso#cadet_create'
  post '/sso/cadet-update/:cid', to: 'sso#cadet_update'
  post '/sso/cadet-delete/:cid', to: 'sso#cadet_delete'

end
