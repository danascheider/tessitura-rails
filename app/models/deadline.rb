class Deadline < ActiveRecord::Base
  belongs_to :listing, dependent: :destroy

  validates_presence_of :listing_id, :date
end
