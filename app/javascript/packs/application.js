import 'bootstrap/dist/js/bootstrap'
window.$ = window.jQuery = require('jquery')
require("@rails/ujs").start()

document.addEventListener('DOMContentLoaded', (event) => {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
})

