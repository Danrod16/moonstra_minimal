import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "button" ]

  create() {
    this.buttonTarget.style = "display: none;"
  }
}
