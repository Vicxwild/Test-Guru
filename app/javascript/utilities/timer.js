document.addEventListener('turbolinks:load', function() {
  const timerElement = document.getElementById('timer')

  if (timerElement) {
    const timeLeft = parseInt(timerElement.dataset.timeLeft)

    if (timeLeft > 0) {
      let timerValue = timeLeft

      const updateTimer = function() {
        const formattedTime = `${Math.floor(timerValue / 60)}:${('0' + timerValue % 60).slice(-2)}`

        timerElement.innerHTML = formattedTime

        timerValue--

        if (timerValue <= 0) {
          clearInterval(timerId)

          window.location.href = window.location.href + '/result'
        }
      }

      const timerId = setInterval(updateTimer, 1000)
    }
  }
})
