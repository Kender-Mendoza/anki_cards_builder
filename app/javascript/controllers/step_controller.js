import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = [ "step1", "step2", "step3" ];

  nextStep(event) {
    const toStep = event.target.getAttribute("data-next-step");

    const step1Element = this.step1Target;
    const step2Element = this.step2Target;
    const step3Element = this.step3Target;

    switch(toStep) {
      case "step1":
        step1Element.classList.add("is-hidden")
        step2Element.classList.remove("is-hidden")
        break;
      case "step2":
        step2Element.classList.add("is-hidden")
        step3Element.classList.remove("is-hidden")
        break;
      case "step3":
        step3Element.classList.add("is-hidden")
        step1Element.classList.remove("is-hidden")
        break;
      default:
        break;
    }
  }
}
