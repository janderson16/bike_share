class Bike < ActiveRecord::Base
  validates :serial_no, presence: true
  has_many :trips
end
