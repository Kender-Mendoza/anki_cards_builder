import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "term", "copyMessage"];

  copy() {
    navigator.clipboard.writeText(this.term);
    this.copyMessageTarget.innerText = "copied!"
  }

  setCopyMessage() {
    this.copyMessageTarget.innerText = "copy"
  }

  get term() {
    return this.termTarget.value;
  }
}
