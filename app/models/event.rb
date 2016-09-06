class Event < ActiveRecord::Base
  belongs_to :user
  has_many :children, through: :members
  has_many :members
  has_many :photos

  validates :start_date, :title, :location, :user_id, presence: true
end
