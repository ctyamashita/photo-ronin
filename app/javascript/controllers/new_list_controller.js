import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "popupButton", "formList" ]

  connect() {
    console.log(this.popupButtonTarget);
    console.log(this.formListTarget);
    console.log('hello world');
  }

  showForm() {
    console.log('click');
    this.formListTarget.classList.toggle("show")
  }
}
