class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }
  has_secure_password
  has_many :posts
 
 
  #  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+\z/ }
end
