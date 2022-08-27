    export class FormInlineEventsHandler {
        constructor(testId) {
        this.testId = testId
        }
   init() {
     let link = document.querySelector('.form-inline-link[data-test-id="' + this.testId + '"]')
     let testTitle = document.querySelector('.test-title[data-test-id="' + this.testId + '"]')
     let formInline = document.querySelector('.form-inline[data-test-id="' + this.testId + '"]')

       if (formInline.classList.contains('hide')) {
         testTitle.classList.add('hide')
         formInline.classList.remove('hide')
         link.textContent = 'Cancel'
       } else {
          testTitle.classList.remove('hide')
          formInline.classList.add('hide')
          link.textContent = 'Edit'
         }
     }
  }

