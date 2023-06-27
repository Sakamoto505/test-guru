document.addEventListener('turbolinks:load', function () {
    let timer = document.querySelector('.timer')

    if (timer) {
        let timeLeft  = timer.dataset.timer

        setInterval(function () {
            timeLeft ? timeLeft-- : document.querySelector('form').submit();
            changeTimer(timeLeft, timer);
        }, 1000);
    }
})

function changeTimer(timerCount, timerObj) {
    line = 'Осталось времени на тест: ';
    timerObj.innerHTML = (line + timerCount);
}
