class Position < ApplicationRecord
  validates_presence_of :job_title

  has_many :users
end
