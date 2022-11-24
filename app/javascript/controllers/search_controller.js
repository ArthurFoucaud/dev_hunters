import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    console.log("coucou")

    console.log(this.element)
  }

  addSearch(event){
    // event.preventDefault();
    console.log("test")
    console.log(this.element.lastElementChild)
    this.element.lastElementChild.classList.remove("d-none")
    // this.element.classList.toggle("display: contents;")
  }

}
