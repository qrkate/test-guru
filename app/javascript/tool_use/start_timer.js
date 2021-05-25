import { Timer } from 'utilities/timer.js'

document.addEventListener('turbolinks:load', function () {
  const timer = document.getElementById('js-timer')

  if(timer) {
    const second = timer.dataset.second
    new Timer(timer, second)
  }
})
