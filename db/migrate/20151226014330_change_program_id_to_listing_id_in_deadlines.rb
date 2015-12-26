class ChangeProgramIdToListingIdInDeadlines < ActiveRecord::Migration
  def change
    rename_column :deadlines, :program_id, :listing_id
  end
end
