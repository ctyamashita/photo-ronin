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
    if (this.buttonTarget.innerHTML === "See Map") {
      this.buttonTarget.innerHTML = "See List";
      this.buttonTarget.className = "bg-black white toggle-button btn-center";
    } else {
      this.buttonTarget.innerHTML = "See Map";
      this.buttonTarget.className = "bg-green black toggle-button btn-center";
    }
  }
}
