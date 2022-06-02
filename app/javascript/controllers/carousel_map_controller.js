import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "carousel", "map", "marker" ]

  connect() {
    console.log('hello world');
  }

  showForm() {
    console.log('click');
    this.formListTarget.classList.toggle("show")
    this.backgroundTarget.classList.toggle("dark-background")
  }
}
