import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button" ]

  photoLike() {
    console.log(this.buttonTarget.classList);
    this.buttonTarget.classList.toggle('liked')
    // this.backgroundTarget.classList.toggle("dark-background")
  }
}
