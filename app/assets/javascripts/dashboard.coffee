$(document).ready ->
  
  # Expand side menu when the user clicks the menu icon

  $('.navbar-brand').click ->
    $('.sidebar-collapse').slideToggle()

  # Hide side menu and dropdown menus when the user double-clicks

  $('body').dblclick (e) ->
    if !($(e.target).closest('.sidebar-collapse').length)
      $('.sidebar-collapse').hide()

    if !($(e.target).closest('ul.dropdown-menu').length)
      $('ul.dropdown-menu').hide()

  # Show dropdown menu when a user clicks on the li
  
  $('a.dropdown-toggle').click (e) ->
    li = $(e.target).closest('.dropdown')
    li.siblings().find('ul.dropdown-menu').hide()
    li.find('ul.dropdown-menu').toggle()
