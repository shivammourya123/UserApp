class Message < ApplicationRecord
    belongs_to :user
   belongs_to :chat_room

  # Broadcast the message after it's created
    # broadcast_append_to "chat_room_#{chat_room_id}", target: "messages", partial: "messages/message", locals: { message: self }
      after_create_commit do
        broadcast_append_to "chat_room_#{chat_room.id}", target: "messages", partial: "messages/message", locals: { message: self }
     end

end
