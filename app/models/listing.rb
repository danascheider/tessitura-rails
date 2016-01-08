class Listing < ActiveRecord::Base
  validates_presence_of :title
  acts_as_list add_new_at: :top 

  has_many :deadlines
  has_many :favorites
  has_many :users, through: :favorites

  accepts_nested_attributes_for :deadlines, reject_if: :all_blank

  before_destroy :destroy_orphan_deadlines

  private
    def destroy_orphan_deadlines
      self.deadlines.each do |deadline|
        deadline.destroy unless deadline.task
      end
    end
end
