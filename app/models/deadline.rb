class Deadline < ActiveRecord::Base
  belongs_to :listing, dependent: :destroy
  belongs_to :task, dependent: :destroy

  scope :upcoming, -> { where('date > ?', Date.current) }
  scope :past, -> { where('date <= ?', Date.current) }

  validates_presence_of :date
end
