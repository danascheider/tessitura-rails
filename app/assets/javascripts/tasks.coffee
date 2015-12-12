$(document).ready ->
  $('#task-panel > .panel-body > .ui-sortable').sortable({
    items: "li:not(.not-sortable)",
    stop : (event, ui) ->
      task_id  = ui.item.attr('id').match(/\d+/)[0]
      prev_id  = ui.item.prev().attr('id').match(/\d+/)[0]
      position = null

      $.ajax(
        url    : "/tasks/#{prev_id}.json",
        success: (task) ->
          position = task['position'] + 1
        )

      $.ajax(
        url     : "/tasks/#{task_id}.json",
        type    : 'PATCH',
        data    : {
          task: {
            position: position
          }
        }
        )
    })