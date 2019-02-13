class Employer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :site_url

  has_many :users
end
