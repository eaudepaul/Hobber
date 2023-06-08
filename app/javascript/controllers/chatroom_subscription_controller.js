import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }



  insertMessageAndScrollDown(data) {
    console.log("I'm scrolling")
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    this.messagesTarget.insertAdjacentHTML("beforeend", data);

    console.log(this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
