class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :fach_id
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
