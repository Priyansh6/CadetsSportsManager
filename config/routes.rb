Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'wso#index'

  get "/wso", to: "wso#index"
  get "/wso/competitions/new", to: "wso#new"
  post "/wso/competitions/create", to: "wso#create", as: :competitions_path
  get "/wso/competitions/:id", to: "wso#show"
end
