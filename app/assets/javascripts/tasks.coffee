taskLi = (task) ->
  return "<li id='task_#{task.id}' class='task ui-sortable-handle ui-sortable-helper'>
        <span class='pull-right edit-task'>
          <a title='Delete' rel='nofollow' data-method='delete' href='/tasks/#{task.id}'>
            <i class='fa fa-times fa-fw'></i>
          </a>
          <a title='Edit Task' href='/tasks/#{task.id}/edit'>
            <i class='fa fa-pencil fa-fw'></i>
          </a>
          <a title='Mark Complete' href='/tasks/#{task.id}?task%5Bstatus%5D=Complete'>
            <i class='fa fa-check fa-fw'></i>
          </a>
        </span>
        <h3 class='task-list-title'>
          <a title='#{task.title}' href='/tasks/#{task.id}'>#{task.title}</a>
        </h3>
        <table>
          <tbody>
            <tr>
              <th>Priority:</th>
              <td>Normal</td>
            </tr>
          </tbody>
        </table>
      </li>"

taskID = (element) ->
  return $(element).attr('id').match(/\d+/)[0]

removeIncompleteTask = (li) ->
  $(li).fadeOut()

  if $('#top_task_widget').length
    element = $('#top_task_widget').find('.huge')
    number = element.html()
    element.html(number - 1)

$(document).ready ->
  $(@).tooltip()

  # Listen for a click on the mark-complete icon
  $('.task a[title="Mark Complete"]').click( ->
    li = $(@).closest('li')
    
    # When a user clicks on the 'Mark Complete' icon, send an Ajax request
    # updating the status of the selected task to 'Complete'

    $.ajax(
      url: "/tasks/#{taskID(li)}.json",
      type: 'PATCH',
      data : {
        task: {
          status: 'Complete'
        }
      },

      # When the task has been successfully marked complete, remove it from the
      # list and update the top task widget if on the main dashboard page

      success : ->
        removeIncompleteTask(li)
      )
    )

  $('.task a[title=Delete]').click( ->
    li = $(@).closest('li')

    # When a user clicks on the 'Delete' icon, send an Ajax request deleting
    # the selected task

    $.ajax(
      url: "/tasks/#{taskID(li)}.json",
      type: 'DELETE',
      success: ->
        removeIncompleteTask(li)
      )
    )

  $('#task-panel .quick-add-form > form').on('ajax:success', (e, task) ->
    @.reset()
    $(@).blur()
    $(@).closest('li').after(taskLi(task))
    )

  # Make task panel sortable, other than the quick-add form
  $('#task-panel > .panel-body > .ui-sortable').sortable({
    items: "li:not(.not-sortable)",

    # When a task li is dropped in the task panel, update its position
    # to reflect where the user has placed it

    stop : (event, ui) ->
      task_id  = taskID(ui.item)
      prev_id  = taskID(ui.item.prev())
      position = null

      # Get the position of the task before the one the user dropped
      # (i.e., immediately before it vis-à-vis its new position)

      $.ajax(
        url    : "/tasks/#{prev_id}.json",
        success: (task) ->
          position = task['position'] + 1
        )

      # Update the dropped task so that it is placed immediately after
      # the task displayed above it in its new position

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

  # Active sortable functionality on kanban columns

  $('#backlog_tasks ul, #in_progress_tasks ul, #blocking_tasks ul').sortable({
    connectWith: '.kanban-col ul',
    items      : "li:not(.quick-add-form)",
    placeholder: "ui-state-highlight",

    # When a task is moved from one kanban column to another, its status is
    # updated to match the status associated with the list it was dropped on.

    stop       : (event, ui) ->
      item    = ui.item.closest('.kanban-col')
      status  = item.attr('data-status')

      $.ajax(
        url   : "/tasks/#{taskID(ui.item)}.json",
        type  : 'PATCH',
        data  : {
          task: {
            status: status
          }
        }
        )
    })