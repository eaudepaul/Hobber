import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["pasttab", "upcomingtab", "upcomingpage", "pastpage"]

  connect() {
    console.log("Hello from tabs controller")
  }

  past() {
    console.log("Hello Antonio")
    this.upcomingtabTarget.classList.remove("active")
    this.upcomingpageTarget.classList.remove("show", "active")
    this.pasttabTarget.classList.add("active")
    this.pastpageTarget.classList.add("show", "active")
  }

  upcoming() {
    console.log("Hello Katharine")
    this.upcomingtabTarget.classList.add("active")
    this.upcomingpageTarget.classList.add("show", "active")
    this.pasttabTarget.classList.remove("active")
    this.pastpageTarget.classList.remove("show", "active")
  }
}
