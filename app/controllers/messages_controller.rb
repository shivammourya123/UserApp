class MessagesController < ApplicationController
  before_action :authenticate_user!

# app/controllers/messages_controller.rb
def create
  @chat_room = ChatRoom.find(params[:chat_room_id])
  @message = @chat_room.messages.build(message_params)
  @message.user = current_user

  if @message.save
    # Broadcast the message via Action Cable to other users
    ChatRoomChannel.broadcast_to(@chat_room, message: render_message(@message))
    
    # Respond with Turbo Stream so the message is added to the chat without a page reload
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to chat_room_path(@chat_room) }
    end
  else
    # Handle save error if needed
    respond_to do |format|
      format.html { render :new }
    end
  end
end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
