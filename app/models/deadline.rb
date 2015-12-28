class Deadline < ActiveRecord::Base
  belongs_to :listing
  belongs_to :task
  
  scope :upcoming, -> { where('date > ?', Date.current) }
  scope :past, -> { where('date <= ?', Date.current) }

  validates_presence_of :date
end
