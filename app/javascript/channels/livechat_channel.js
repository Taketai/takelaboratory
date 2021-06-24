import consumer from "./consumer"

consumer.subscriptions.create("LivechatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class='chat-userbox'><p>${data.content.text}</p></div>`;
    const livechats = document.getElementById('livechats');
    const newLivechat = document.getElementById('livechat_text');
    livechats.insertAdjacentHTML('afterbegin', html);
    newLivechat.value='';
  }
});
