import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    potentialMatchUsername: String,
    matchChatroomId: String
  }

  connect() {
    console.log("Hello from the match pop-up controller");
  }

  pop_up() {
    Swal.fire({
      html:
      '<h4>You matched!</h4>' +
      `<p>Chat with ${this.potentialMatchUsernameValue} now or keep swiping</p>`,
      showCloseButton: true,
      showCancelButton: true,
      focusConfirm: false,
      confirmButtonColor: '#FFBD00',
      confirmButtonText:
      `<a href="/chatrooms/${this.matchChatroomIdValue}" style="border-radius: 30%;"><i class="fa-regular fa-comment fa-2xl" style="color: #008000;"></i></a>`,
      confirmButtonAriaLabel: 'Match',
      cancelButtonColor: '#FFBD00',
      cancelButtonText:
      '<a href="/user_matches/new" style="border-radius: 30%;"><i class="fa-solid fa-gamepad fa-2xl" style="color: #008000;"></i></a>',
      cancelButtonAriaLabel: 'Keep swiping'
    })
  }
}
