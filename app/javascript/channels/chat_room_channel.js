import consumer from "./consumer"

const initChatRoomCable = () => {
  const messagesContainer = document.getElementById('messages')
  if (messagesContainer) {
    const chatRoomId = messagesContainer.dataset.chatRoomId

    consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: chatRoomId },
      {
        received(data) {
          // Appends the new message to the messages container
          messagesContainer.insertAdjacentHTML('beforeend', data.message)
        }
      }
    )
  }
}

export { initChatRoomCable }
