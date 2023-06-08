Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'competitions#index'
  resources :competitions

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
