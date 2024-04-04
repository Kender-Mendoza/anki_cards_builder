import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "name" ]
  static values = {
    url: String
  }

  connect() {
    console.log(this.urlValue);
  }

  greet() {
    console.log("Que la mame ", this.name);
    console.log(this.urlValue);
  }

  get name() {
    return this.nameTarget.value
  }
}
