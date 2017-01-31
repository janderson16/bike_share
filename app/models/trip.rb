class Trip < ActiveRecord::Base
  validates :duration, :start_station_id, :start_date, :end_station_id, :end_date, :bike_id, :subscription_type, presence: true
  has_one :subscription
  has_one :bike
end
