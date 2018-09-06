class Employee < ApplicationRecord
  has_many :attendances, dependent: :destroy
  # name can't be blank, and of length 5 to 50 chars
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }
  # simple regex for the accepted mobile number, must be consists of numbers only
	VALID_MOBILE_REGEX = /\A[0-9]+\z/
  # mobile length must be 10 numbers, using the mobile regex, must be present not blank, and must be unique per account
	validates :mobile, length: { minimum: 10, maximum: 10 },format: { with: VALID_MOBILE_REGEX }, presence: true, uniqueness: true
  # validate email present not blank, and maximum 255 char, and more xD
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #hiring date must be exist, time.current for the rails app ActiveRecord local time which was set to cairo in application.rb
  #hiring date can be between 30 years ago and up to today
  validates :hiredate, presence: true, inclusion: { in: (Time.current-30.years..Time.current) }                 
end
