$(document).ready ->
  
  # Listener expands side menu when the user clicks the menu icon
  $('.navbar-brand').click (e) ->
    $('.sidebar-collapse').slideToggle()