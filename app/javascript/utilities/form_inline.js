import {FormInlineEventsHandler} from "./form_inline_class";

  document.addEventListener('turbolinks:load', function () {
    const controls = document.querySelectorAll('.form-inline-link');

     if (controls.length) {
         for (let i = 0; i < controls.length; i++) {
              controls[i].addEventListener('click', formInlineLinkHandler);
         }
    }
     let errors = document.querySelector('.resource-errors')
        if (errors) {
            let resourceId = errors.dataset.resourceId
            let formHandler =  new FormInlineEventsHandler(resourceId)
            let formInline = document.querySelector('.form-inline[data-test-id="' + this.testId + '"]')
        if (formInline) formHandler.init()
        }
    })

  function formInlineLinkHandler(event) {
      event.preventDefault();

      let  testId = this.dataset.testId;
      let formHandler = new FormInlineEventsHandler(testId);
      let formInline = document.querySelector('.form-inline[data-test-id="' + this.testId + '"]')
      if (formInline) formHandler.init()
  }


