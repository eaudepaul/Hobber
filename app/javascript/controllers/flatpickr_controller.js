import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {
      enableTime: true,
      dateFormat: "H:i",
      altFormat: "F j, Y",
      minDate: "today",
    })
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      dateFormat: "H:i",
      altFormat: "F j, Y",
      minDate: "today",
    })
}
}
