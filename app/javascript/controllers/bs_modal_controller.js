import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bs-modal"
export default class extends Controller {
  connect() {
    console.log('connected');
    this.modal = new bootstrap.Modal(this.element);
    console.log(this.modal);
    this.modal.show();
  }

  disconnect(){
    this.modal.hide();
  }

  submitForm(event){
    this.modal.hide();
  }
}
