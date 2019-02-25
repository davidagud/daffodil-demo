class User < ApplicationRecord
  before_save { self.username = username.capitalize }
  validates_uniqueness_of :username, :case_sensitive => false
  validates :username, presence: true
  validates :password, presence: true

  has_secure_password

end
