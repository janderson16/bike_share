class Bike < ActiveRecord::Base
  validates :serial_no, presence: true
  belongs_to :trip
end
