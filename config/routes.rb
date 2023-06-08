Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'wso#index'

  get "/wso", to: "wso#index"
  get "/wso/competitions/new", to: "wso#new_competition"
  post "/wso/competitions/create", to: "wso#create_competition", as: :competitions_path
  get "/wso/competitions/edit/:id", to: "wso#edit_competition"
  get "/wso/competitions/:id/age-ranges/edit", to: "wso#edit_age_ranges"
  post "/wso/competitions/:id/age-ranges/save", to: "wso#save_age_ranges"
end
