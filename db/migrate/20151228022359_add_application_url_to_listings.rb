class AddApplicationUrlToListings < ActiveRecord::Migration
  def change
    add_column :listings, :application_url, :string
  end
end
