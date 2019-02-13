class User < ApplicationRecord
  validates_presence_of :password_digest
  validates_presence_of :email

  belongs_to :location
  belongs_to :position
  belongs_to :employer
end
