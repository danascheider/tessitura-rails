class AddWebSiteToListings < ActiveRecord::Migration
  def up
    add_column :listings, :web_site, :string
  end

  def down
    remove_column :listings, :web_site
  end
end
