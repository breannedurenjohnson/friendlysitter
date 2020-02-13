class Parent < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :first_name, :last_name, length: {minimum: 2}
  validates :state, length: { is: 2 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 8, maximum: 72}, on: :create
  
  before_save :downcase_email

  has_many :friendships, :foreign_key => "parent_id", :class_name => "Friendship"
  has_many :friends, :through => :friendships
  has_many :hires, dependent: :destroy
  has_many :sitters_hired, through: :hires, source: :sitter
  has_many :compliments, dependent: :destroy

  private
  def downcase_email
    self.email.downcase!
  end
end
