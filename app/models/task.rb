class Task < ActiveRecord::Base 
  before_validation :set_priority

  validates_presence_of :title
  validates :status, inclusion: { in: ["In Progress", "Blocking", "Complete"], allow_nil: true }
  validates :priority, inclusion: { in: ["Urgent", "High", "Normal", "Low", "Not Important"] }

  belongs_to :user
  acts_as_list scope: :user

  private
    def set_priority
      self.priority ||= 'Normal'
    end
end
