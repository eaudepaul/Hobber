import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from the match pop-up controller");
  }

  pop_up() {
    Swal.fire({
      html:
      '<h4>You matched!</h4>' +
      '<p>Chat with your new match now or keep swiping</p>',
      showCloseButton: true,
      showCancelButton: true,
      focusConfirm: false,
      cancelButtonColor: '#716add',
      confirmButtonText:
      '<a href="/user_matches/new"><i class="fa-regular fa-comment fa-2xl" style="color: #FFFFFF;"></i></a>',
      confirmButtonAriaLabel: 'Thumbs up, great!',
      cancelButtonText:
      '<a href="/user_matches/new"><i class="fa-solid fa-person-walking-arrow-right" style="color: #FFFFFF;"></i></a>',
      cancelButtonAriaLabel: 'Thumbs down'
    })
  }
}
