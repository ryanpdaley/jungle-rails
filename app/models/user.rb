class User < ActiveRecord::Base
  has_secure_password
  validates :email, {
    presence: true,
    uniqueness: {case_sensitive: false}
  }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, {
    presence: true,
    length: { minimum: 5 }
  }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    cleanEmail = email.strip.downcase
    user = User.find_by_email(cleanEmail)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  def describe
    "#{first_name} #{last_name} #{password} #{password_confirmation}"
  end
end
