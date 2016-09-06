class User < ActiveRecord::Base
  has_many :children
  has_many :events
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]#content_type: /\Aimage\/.*\Z/
  # has_attached_file :avatar
  # validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  LETTERS_ONLY_REGEX = /\A^[A-Za-z]+$\z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, format: { with: LETTERS_ONLY_REGEX }, length: { in: 2..50 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, length: { in: 8..40 }
  validates :password, presence: true, length: { in: 8..20 }, on: :create
  validates_confirmation_of :password, on: :create

  before_save do
    self.first_name.capitalize!
    self.last_name.capitalize!
    self.email.downcase!
  end
end
