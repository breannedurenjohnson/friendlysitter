class Sitter < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :city, :state, :about, :hourly_rate, presence: true
  validates :first_name, :last_name, :about, length: {minimum: 2}
  validates :state, length: { is: 2 }
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 0 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 8, maximum: 72}, on: :create
  
  before_save :downcase_email

  has_many :hires, dependent: :destroy
  has_many :parents_who_hired, through: :hires, source: :parent
  has_many :compliments, dependent: :destroy

  private
  def downcase_email
    self.email.downcase!
  end
end
