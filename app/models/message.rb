class Message < ApplicationRecord
  validates_presence_of :meeting_date
  validates_presence_of :meeting_location
  validates_presence_of :status

  belongs_to :user
  belongs_to :connection, :class_name => "User"
end
