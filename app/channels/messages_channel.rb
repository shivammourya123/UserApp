# app/channels/messages_channel.rb

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # Subscribe to a unique channel for each chat room
    stream_from "chat_room_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
