require 'bootstrap/js/src/tooltip'

window.InterviewBot.BootstrapTooltips =
  initialize: (element) ->
    $(element).find('[data-toggle="tooltip"]').tooltip()
