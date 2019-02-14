class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_secure_password validations: false

  belongs_to :location, optional: true
  belongs_to :position, optional: true
  belongs_to :employer, optional: true

  has_many :messages
  has_many :connections, through: :messages


  def make_key
    SecureRandom.urlsafe_base64(12)
  end

  def all_connections(user_id)
    User.joins(:messages).where("messages.user_id = #{user_id} OR messages.connection_id = #{user_id}")
  end
end
