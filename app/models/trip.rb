class Trip < ActiveRecord::Base
  validates :duration, :start_station, :start_date, :end_station, :end_date, :bike_id, :subscription_type, :zip_code, presence: true
end
