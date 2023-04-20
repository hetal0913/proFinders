import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countries"
export default class extends Controller {
  connect() {
    console.log("country connected");
  }

  initialize(){
    this.element.setAttribute("data-action", "change->countries#loadStates")
  }

  loadStates(){
    const selected = this.element.options[this.element.selectedIndex].value;
    this.url = `/users/fetch_states?country_code=${selected}`
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    }).then(response=> response.text())
    .then(html=> Turbo.renderStreamMessage(html))
  }
}
