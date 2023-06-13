import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="timepicker"
export default class extends Controller {
  connect() {
    console.log("Timepicker connected")
    flatpickr(this.element, {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        minuteIncrement: 5,
    })
  }
}
