class AddMinimumAgeAndMaximumAgeToListings < ActiveRecord::Migration
  def up
    add_column :listings, :minimum_age, :integer
    add_column :listings, :maximum_age, :integer
  end

  def down
    remove_column :listings, :minimum_age 
    remove_column :listings, :maximum_age
  end
end
