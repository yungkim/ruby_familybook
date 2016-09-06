class Member < ActiveRecord::Base
  belongs_to :child
  belongs_to :event
  # has_many :children
end
