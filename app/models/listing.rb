class Listing < ActiveRecord::Base
  validates_presence_of :title
  acts_as_list add_new_at: :top
end
