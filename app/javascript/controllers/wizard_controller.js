import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['step']

  goToNext(event) {
    console.log('someting')
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;
    console.log(this.stepTargets[nextStep].classList);


    this.stepTargets[nextStep].classList.add("hidden");
    this.stepTargets[actualStep].classList.remove("hidden");
    console.log(event.target.dataset);
  }

  goToPrevious(event) {
    const previousStep = event.target.dataset.previousStep - 1;
    const actualStep = event.target.dataset.previousStep;
    console.log(this);
    this.stepTargets[actualStep].classList.add("hidden");
    this.stepTargets[previousStep].classList.remove("hidden");
  }
}
