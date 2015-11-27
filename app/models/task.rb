class Task < ActiveRecord::Base
  before_validation :set_priority

  validates :status, inclusion: { in: ["In Progress", "Blocking", "Complete"], allow_nil: true }
  validates :priority, inclusion: { in: ["Urgent", "High", "Normal", "Low", "Not Important"] }

  private
    def set_priority
      self.priority ||= 'Normal'
    end
end
