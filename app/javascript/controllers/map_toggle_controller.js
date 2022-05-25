import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map", 'list', 'button' ]

  connect() {
    console.log('connected')
  }

  mapDisplay() {
    console.log('click')
    this.mapTarget.classList.toggle('d-none')
    this.listTarget.classList.toggle('d-none')
    if (this.buttonTarget.innerHTML === "Map") {
      this.buttonTarget.innerHTML = "See List";
    } else {
      this.buttonTarget.innerHTML = "See Map";
    }
  }
}
