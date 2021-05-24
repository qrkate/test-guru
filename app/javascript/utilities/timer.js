document.addEventListener('turbolinks:load', function() {
const timerId = document.getElementById("js-timer")
  if (timerId) {
    startTimer()

  function startTimer() {
    const time = timerId.innerHTML.split(':')
    let minut = time[0]
    let second = time[1]
    if (minut == 0 && second == 0) {
      document.getElementById('next').click()
    }else if (second == 0) {
      minut--
      second = 59
    }else {
      second--
    }
    if (second <= 15) timerId.style.color = 'red'
    timerId.innerHTML = `${minut}:${second}`
    setTimeout(startTimer, 1000)
    }
  }
})
