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

  def get_connections(user_ids)
    User.select(:id, :name, :email).where(id: user_ids)
  end

  def self.filter(params)
    User.where("name LIKE ?", "%#{params[:name]}%")
  end
end
