class Task < ActiveRecord::Base 
  before_validation :set_priority

  validates_presence_of :title
  validates :status, inclusion: { in: ["In Progress", "Blocking", "Complete"], allow_blank: true }
  validates :priority, inclusion: { in: ["Urgent", "High", "Normal", "Low", "Not Important"] }

  belongs_to :user
  acts_as_list scope: :user

  def display_deadline
    return nil if deadline.blank?
    
    datetime = deadline.to_datetime
    weekday = DateTime::DAYNAMES[datetime.cwday == 7 ? 0 : datetime.cwday]
    month = DateTime::MONTHNAMES[datetime.month]
    day = datetime.day
    year = datetime.year

    "#{weekday}, #{month} #{day}, #{year}"
  end

  private
    def set_priority
      self.priority ||= 'Normal'
    end
end
