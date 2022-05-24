import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map", 'list', 'button' ]

  connect() {
  }

  map_display() {
    this.mapTarget.classList.remove('d-none')
    this.listTarget.classList.add('d-none')
    this.buttonTarget.innerHTML = '<i class="icon-big gray fas fa-bars" data-action="click->map-toggle#list_display" data-map-toggle-target="button"></i>'
  }

  list_display() {
    this.mapTarget.classList.add('d-none')
    this.listTarget.classList.remove('d-none')
    this.buttonTarget.innerHTML = '<i class="icon-big gray fas fa-map" data-action="click->map-toggle#map_display" data-map-toggle-target="button"></i>'
  }
}
