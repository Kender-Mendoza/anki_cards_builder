import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "name" ]

  connect() {
    console.log("Que la mame Richard", this.element);
  }

  greet() {
    console.log("Que la mame ", this.name);
  }

  get name() {
    return this.nameTarget.value
  }
}
