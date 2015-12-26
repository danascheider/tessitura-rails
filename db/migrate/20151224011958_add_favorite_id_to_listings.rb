class AddFavoriteIdToListings < ActiveRecord::Migration
  def up
    add_column :listings, :favorite_id, :integer
  end

  def down
    remove_column :listings, :favorite_id
  end
end
