Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/createEvent' , to: 'welcome#create_event', as: 'create_event'

  root 'welcome#index'

end
