import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    const chatRoomId = messagesContainer.dataset.chatRoomId;
    consumer.subscriptions.create({ channel: "MessagesChannel", chat_room_id: chatRoomId }, {
      received(data) {
        messagesContainer.insertAdjacentHTML("beforeend", data);
      }
    });
  }
});
