document.addEventListener('turbolinks:load', function() {
    let bar = document.querySelector(".progress-bar");
    if (bar) {
        let progress_bar  = bar.dataset.progress
        let count = bar.dataset.count
        let progress = (progress_bar / count) * 100
        bar.style.width = progress + "%";
    }
})





