class Trip < ActiveRecord::Base
  validates :duration, :start_station_name, :start_date, :end_station_name, :end_date, :bike_id, :subscription_type, presence: true
end
