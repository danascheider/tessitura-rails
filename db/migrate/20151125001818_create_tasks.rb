class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :deadline
      t.string :status
      t.string :priority
      t.string :notes
      t.integer :position
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
