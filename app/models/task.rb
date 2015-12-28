class Task < ActiveRecord::Base 
  before_validation :set_priority

  validates_presence_of :title
  validates :status, inclusion: { in: ["In Progress", "Blocking", "Complete"], allow_blank: true }
  validates :priority, inclusion: { in: ["Urgent", "High", "Normal", "Low", "Not Important"] }

  belongs_to :user
  has_one :deadline, dependent: :destroy
  acts_as_list scope: :user, add_new_at: :top
  accepts_nested_attributes_for :deadline

  def display_deadline
    return nil unless self.deadline
    
    datetime = deadline.date.to_datetime
    weekday = DateTime::DAYNAMES[datetime.cwday == 7 ? 0 : datetime.cwday]
    month = DateTime::MONTHNAMES[datetime.month]
    day = datetime.day
    year = datetime.year

    "#{weekday}, #{month} #{day}, #{year}"
  end

  def short_title chars
    return title if title.length <= chars
    
    ending = ' ...'
    array = title[0..chars - (ending.length + 1)].split(' ')
    array.pop
    array.join(' ') + ending
  end

  private
    def set_priority
      self.priority ||= 'Normal'
    end
end
