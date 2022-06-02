import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "marker" ]

  connect() {
    console.log('hello world');
  }

  selectPin() {
    const markers = this.markerTargets
    const activePicture = document.querySelector(".carousel-inner .active")
    const activePictureID = parseInt(activePicture.dataset.id)

    markers.forEach((marker) => {
      marker.classList.add('d-none')
      if (activePictureID === parseInt(marker.dataset.id)) {
        marker.classList.remove('d-none')
        marker.click()
      }
    })

  }
}
