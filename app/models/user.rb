class User < ApplicationRecord
  before_save { self.username = username.capitalize }
  validates_uniqueness_of :username, :case_sensitive => false
  validates :username, presence: true
  validates :password, presence: true
  validate :password_complexity

  has_secure_password

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

end
