document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.tg-progress-bar')
  if (!progressBar) return;

  const position = progressBar.dataset.position
  const count = progressBar.dataset.count

  let percent = 0

  if (position && count) {
    percent = position / count * 100
  }

  const progressEl = progressBar.querySelector('.tg-progress')
  progressEl.style.width = `${percent}%`
})
