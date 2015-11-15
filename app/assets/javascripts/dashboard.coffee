$(document).ready ->
  
  # Listener expands side menu when the user clicks the menu icon
  $('.navbar-brand').click ->
    $('.sidebar-collapse').slideToggle()

  $('body').dblclick (e) ->
    if !($(e.target).closest('.sidebar-collapse').length)
      $('.sidebar-collapse').hide()