export class Timer {

  constructor(elem, second) {
     this.elem = elem
     this.second = second

     this.setup()
  }

  setup() {
    this.id = setInterval(() => this.changeTime(), 1000)
  }

  changeTime() {
    if (this.second <= 0){
      clearInterval(this.id)
      document.forms.passed_test.submit()
    } else {
      this.elem.innerHTML = Math.floor(this.second / 60) + ":" + Math.floor(this.second % 60)
      this.second--
    }
  }
}
