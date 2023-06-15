class RegistrationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "registration_channel"
  end

  def receive(data)
    ActionCable.server.broadcast("registration_channel", message: data[message])
  end

  def some
    ActionCable.server.broadcast("registration_channel", "Hello")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
