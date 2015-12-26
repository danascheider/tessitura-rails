class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.date :date
      t.string :description
      t.integer :program_id

      t.timestamps null: false
    end
  end
end
