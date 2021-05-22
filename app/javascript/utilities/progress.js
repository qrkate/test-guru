document.addEventListener('turbolinks:load', function() {
  const progress_bar = document.querySelector(".progress-bar")

  if (progress_bar) {
    const current = progress_bar.dataset.current
    const count = progress_bar.dataset.count
    const progress = (current / count) * 100
    progress_bar.style.width = progress + '%'
    progress_bar.textContent = Math.round(progress) + `%`
  }
})
