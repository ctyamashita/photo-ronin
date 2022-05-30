import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "page", "photo", "menu", "active", "nonActive" ]

  connect() {
    // console.log(this.popupButtonTarget);
    // console.log(this.formListTarget);
    // console.log('hello world');
  }

  show() {
    this.photoTarget.classList.toggle("d-none")
    this.pageTarget.classList.toggle("d-none")
    this.menuTarget.classList.toggle("d-none")
    this.activeTarget.classList.add("active")
    this.nonActiveTarget.classList.remove("active")
  }
}
