# app/models/chat_room.rb
class ChatRoom < ApplicationRecord
  has_many :messages, class_name: "Message", dependent: :destroy
  has_many :users, through: :messages
end
