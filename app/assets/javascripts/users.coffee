$(document).ready ->
  $('#user_birthdate').datepicker()

  # Show the form to edit an attribute when the user double-clicks
  # on the attribute.

  $('#user_profile span.p').dblclick ->
    $(@).hide()
    $(@).siblings('span.form').show()

  # Hide any visible user edit forms if the user clicks outside the form
  
  $('body').click (e) ->
    if !$('span.form').has(e.target).length
      $('#user_profile span.form').hide()
      $('#user_profile span.p').show()