$(document).ready ->
  $(@).tooltip()

  $('#task-panel .quick-add-form > form').on('ajax:success', (e, task) ->
    html = "<li id='task_#{task.id}' class='task ui-sortable-handle ui-sortable-helper'>
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

    @.reset()
    $(@).blur()
    $(@).closest('li').after(html)
    )

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

  $('#backlog_tasks ul, #in_progress_tasks ul, #blocking_tasks ul').sortable({
    connectWith: '.kanban-col ul',
    items      : "li:not(.quick-add-form)",
    placeholder: "ui-state-highlight",
    stop       : (event, ui) ->
      task_id = ui.item.attr('id').match(/\d+/)[0]
      item    = ui.item.closest('.kanban-col')
      status  = item.attr('data-status')

      $.ajax(
        url   : "/tasks/#{task_id}.json",
        type  : 'PATCH',
        data  : {
          task: {
            status: status
          }
        }
        )
    })