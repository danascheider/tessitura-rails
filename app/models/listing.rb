class Listing < ActiveRecord::Base
  validates_presence_of :title
  acts_as_list add_new_at: :top

  has_many :favorites
  has_many :users, through: :favorites
end
