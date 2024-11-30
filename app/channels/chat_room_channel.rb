# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    @chat_room = ChatRoom.find(params[:chat_room_id])
    stream_for @chat_room
    Rails.logger.info "Subscribed to ChatRoomChannel for chat_room_id: #{@chat_room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
