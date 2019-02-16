class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_secure_password validations: false

  belongs_to :location, optional: true
  belongs_to :position, optional: true
  belongs_to :employer, optional: true

  has_many :messages, dependent: :destroy
  has_many :connections, through: :messages


  def make_key
    SecureRandom.urlsafe_base64(12)
  end

  def get_connections(user_ids)
    User.select(:id, :name, :email).where(id: user_ids)
  end

  def get_suggestions(user)
    x = User.select("users.id, users.name, locations.city AS city")
    .joins(:location)
    .where("users.location_id = #{user.location_id}")
    .where("users.id != #{user.id}")
    .limit(3)
    .shuffle()
  end

  def self.filter(params)
    key = params.keys.first
    value = params[key].gsub('-', ' ')
    if key == "name"
      User.where("name LIKE ?", "%#{value}%")
    elsif key == "city"
      User.joins(:location).where("locations.#{key} LIKE ?", "%#{value}%")
    elsif key == "employer"
      User.joins(:employer).where("employers.name LIKE ?", "%#{value}%")
    elsif key == "position"
      User.joins(:position).where("positions.job_title LIKE ?", "%#{value}%")
    end
  end
end
