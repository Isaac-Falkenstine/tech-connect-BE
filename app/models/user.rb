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
    User.select("users.id, users.name, users.photo, locations.city AS city, employers.name AS company, positions.job_title").joins(:employer, :location, :position).where(id: user_ids)
  end

  def self.get_user_info(id)
    user = User.find(id)
    {name: user.name, photo: user.photo}
  end

  def get_suggestions(user)
    connections = user.connections.uniq.pluck(:id)
    User.select("users.id, users.name, locations.city AS city, employers.name AS company, positions.job_title, users.photo").joins(:employer, :location, :position).where("users.location_id = #{user.location_id}").where.not(id: connections).where.not(id: user.id).shuffle().first(3)
  end

  def self.filter(params)
    key = params.keys.first
    value = params[key].gsub('-', ' ')
    key_string = key.to_s

    if key_string == "name"
      User.where("name LIKE ?", "%#{value}%")
    elsif key_string == "city"
      User.joins(:location).where("locations.#{key} LIKE ?", "%#{value}%")
    elsif key_string == "employer"
      User.joins(:employer).where("employers.name LIKE ?", "%#{value}%")
    elsif key_string == "position"
      User.joins(:position).where("positions.job_title LIKE ?", "%#{value}%")
    end
  end
end
