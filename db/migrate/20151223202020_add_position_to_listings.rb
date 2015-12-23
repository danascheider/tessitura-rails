class AddPositionToListings < ActiveRecord::Migration
  def change
    add_column :listings, :position, :integer
  end
end
