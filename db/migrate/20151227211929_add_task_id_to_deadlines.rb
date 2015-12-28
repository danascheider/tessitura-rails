class AddTaskIdToDeadlines < ActiveRecord::Migration
  def change
    add_column :deadlines, :task_id, :integer
  end
end
