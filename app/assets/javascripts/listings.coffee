ready = ->
  #

addToFavorites = (e) ->
  e.preventDefault()

  console.log('Adding to favorites')

  listing_id = $(@).closest('.listing').attr('id').match(/(\d+)/)[0]
  user_id = $(@).closest('span.add-to-favorites').attr('data-user-id')

  $.ajax(
    url: "/users/#{user_id}/favorites.json",
    type: "POST",
    data: {
      favorite: {
        user_id: user_id,
        listing_id: listing_id
      }
    },
    success: (favorite) ->
      $(e.target).closest('span').removeClass('add-to-favorites').addClass('favorite')
      $(e.target).closest('span').attr('title', 'Remove Favorite')
      $(e.target).closest('span').attr('data-favorite-id', favorite.id)
    )

removeFromFavorites = (e) ->
  e.preventDefault()

  console.log('Removing from favorites')

  favorite_id = $(@).closest('span.favorite').attr('data-favorite-id')
  user_id = $(@).closest('span.favorite').attr('data-user-id')

  $.ajax(
    url: "/users/#{user_id}/favorites/#{favorite_id}.json",
    type: "DELETE",
    success: ->
      $(e.target).closest('span').removeClass('favorite').addClass('add-to-favorites')
      $(e.target).closest('span').attr('title', 'Add to Favorites')
    )

$(document).on('click', 'span.add-to-favorites i.fa-star', addToFavorites)
$(document).on('click', 'span.favorite i.fa-star', removeFromFavorites)

$(document).ready(ready)
$(document).on('page:load', ready)