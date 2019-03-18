class Message < ApplicationRecord
  validates_presence_of :meeting_date
  validates_presence_of :meeting_location
  validates_presence_of :status

  belongs_to :user
  belongs_to :connection, :class_name => "User"

  def self.connected?(user_id, connection_id)
    message = Message.where("user_id = #{user_id} AND connection_id = #{connection_id}")

    if message.length > 0
      return true
    else
      return false
    end
  end

  def self.find_by_user(user)
    Message.where("user_id = #{user.id} OR connection_id = #{user.id}")
  end

  def self.find_token?(token)
    Message.where(token: token)
  end 

end
