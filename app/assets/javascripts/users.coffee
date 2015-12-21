$(document).ready ->
  $('#user_birthdate').datepicker()

  $('body').click ->
    #

  $('#user_profile span.p').dblclick ->
    $(@).hide()
    $(@).siblings('span.form').show()