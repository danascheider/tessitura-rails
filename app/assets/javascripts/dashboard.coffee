showSidebar = ->
  $('.navbar-static-side').show()
  $('.sidebar-collapse').slideDown()

hideSidebar = ->
  $('.sidebar-collapse').slideUp()
  setTimeout(( ->
    $('.navbar-static-side').hide()), 400)

toggleSidebar = ->
  if $('.sidebar-collapse').is(':visible')
    hideSidebar()
  else
    showSidebar()

$(document).ready ->
  
  # Expand side menu when the user clicks the menu icon

  $('.navbar-brand').click ->
    toggleSidebar()

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
