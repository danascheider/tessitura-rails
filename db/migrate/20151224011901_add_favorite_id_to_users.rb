class AddFavoriteIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :favorite_id, :integer
  end

  def down
    remove_column :users, :favorite_id
  end
end
