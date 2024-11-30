class User < ApplicationRecord
  include CommonBehaviour
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :messages, class_name: "Message", dependent: :destroy
  has_many :chat_rooms, through: :messages

  after_create :send_welcome

  def send_welcome
    UserMailer.welcome_email(self).deliver_now
  end
end
