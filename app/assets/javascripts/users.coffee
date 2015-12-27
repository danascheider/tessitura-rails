ready = ->
  $('#user_birthdate').datepicker()

$(document).ready(ready)
$(document).on('page:load', ready)