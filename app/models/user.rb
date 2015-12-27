class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates :email, confirmation: true
  validates_acceptance_of :terms

  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  has_many :favorites
  has_many :listings, through: :favorites

  def admin?
    admin === true
  end

  def age
    return nil unless birthdate
    
    now = Date.current
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
