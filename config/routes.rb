Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'competitions#index'
  resources :competitions

  get '/sso/competitions', to: 'sso#competitions'
  get '/sso/:compid/events', to: 'sso#competition_page'

end
