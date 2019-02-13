class Location < ApplicationRecord
  validates_presence_of :city

  has_many :users
end
