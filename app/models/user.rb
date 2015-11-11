class User < ActiveRecord::Base
  validates_presence_of :username, :password_digest, :email, :first_name, :last_name
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password, :email
  validates_acceptance_of :terms
  has_secure_password
end
