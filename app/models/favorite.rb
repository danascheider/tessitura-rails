class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates_presence_of :user_id, :listing_id
end
