import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div class="comment_user_name"><p>${data.user}</p></div>
      <div class="comment_comment"><p>${data.content.comment}</p></div>`;
    const messages = document.getElementById('comments_content');
    const newMessage = document.getElementById('comment_comment');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value = '';
    messages.scrollTop = messages.scrollHeight;
    }
});
