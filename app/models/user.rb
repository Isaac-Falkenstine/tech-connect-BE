class User < ApplicationRecord
  validates_presence_of :password_digest
  validates :email, uniqueness: true, presence: true
  has_secure_password validations: false


  belongs_to :location
  belongs_to :position
  belongs_to :employer
  has_many :messages
  has_many :connections, through: :messages
end
