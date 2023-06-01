class WelcomeController < ApplicationController

  def create_event
    Event.create(name: params[:name])
    redirect_to root_path
  end

end
