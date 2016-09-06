class Child < ActiveRecord::Base
  belongs_to :user
  # belongs_to :event
  has_many :events, through: :members
  has_many :members
  # has_many :events, through: :members
  has_attached_file :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]#content_type: /\Aimage\/.*\Z/

  LETTERS_ONLY_REGEX = /\A^[A-Za-z]+$\z/
  validates :first_name, presence: true
  validates :first_name, format: { with: LETTERS_ONLY_REGEX }, length: { in: 2..50 }

  before_save do
    self.first_name.capitalize!
  end
end
