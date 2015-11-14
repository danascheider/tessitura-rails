class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  validates_presence_of :first_name, :last_name, :username
  validates :email, confirmation: true
  validates_acceptance_of :terms

  def full_name
    "#{first_name} #{last_name}"
  end
end
