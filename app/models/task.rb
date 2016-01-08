class Task < ActiveRecord::Base 
  before_validation :set_priority
  before_destroy :destroy_orphan_deadline

  validates_presence_of :title
  validates :status, inclusion: { in: ["In Progress", "Blocking", "Complete"], allow_blank: true }
  validates :priority, inclusion: { in: ["Urgent", "High", "Normal", "Low", "Not Important"] }

  belongs_to :user
  has_one :deadline
  acts_as_list scope: :user, add_new_at: :top
  accepts_nested_attributes_for :deadline, reject_if: :all_blank

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

    def destroy_orphan_deadline
      if self.deadline && !self.deadline.listing_id
        self.deadline.destroy
      end
    end
end
