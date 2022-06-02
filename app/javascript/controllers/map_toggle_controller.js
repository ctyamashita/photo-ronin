import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map", 'list', 'button' ]

  connect() {
  }

  mapDisplay() {
    // this.mapTarget.classList.toggle('d-none')
    // no need for above
    this.listTarget.classList.toggle('d-none')
    if (this.buttonTarget.innerHTML === "See List") {
      this.buttonTarget.innerHTML = "See Map";
      this.buttonTarget.className = "toggle-button btn-center";
    } else {
      this.buttonTarget.innerHTML = "See List";
      this.buttonTarget.className = "toggle-button btn-center";
    }
  }
}
