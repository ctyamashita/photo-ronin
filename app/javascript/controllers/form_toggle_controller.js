import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list", 'new', 'button' ]

  connect() {
    console.log('connected')
  }

  formDisplay() {
    console.log('click')
    this.listTarget.classList.toggle('d-none')
    this.newTarget.classList.toggle('d-none')
    if (this.buttonTarget.innerHTML === "New list") {
      this.buttonTarget.innerHTML = "Existing list";
    } else {
      this.buttonTarget.innerHTML = "New list";
    }
  }
}
