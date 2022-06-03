// import { Application, Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"
// window.Stimulus = Application.start()
// Stimulus.register("circle-click", class extends Controller {


// 👇👇 UNCOMMENT THE BELOW LINE WHEN USING THE CODE IN A NEW CONTROLLER 👇👇
import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("circle-click")
  }

  start(event) {
    switch (event.type){
      case "click":
        this.showCircle(event, 1)
        break;
      case "touchmove":
        this.showCircle(event.targetTouches[0], 0.1)
        break;
    }
  }
  showCircle(cursor, seconds) {
    const circle = document.createElement("div")
    circle.style.position = "fixed";
    circle.style.backgroundColor = "grey";
    circle.style.borderRadius = "50%";
    circle.style.left = `${cursor.clientX - 16}px`;
    circle.style.top = `${cursor.clientY - 16}px`;
    circle.style.height = "32px";
    circle.style.width = "32px";
    circle.style.opacity = 0.8;
    document.body.appendChild(circle);
    setTimeout(() => {
    circle.remove()
    }, seconds * 300)
  }
}
