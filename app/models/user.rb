class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates :email, confirmation: true
  validates_acceptance_of :terms

  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  def admin?
    admin === true
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
