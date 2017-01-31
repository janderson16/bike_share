class Trip < ActiveRecord::Base
  validates :duration, :start_station_id, :start_date, :end_station_id, :end_date, :bike_id, :subscription_id, presence: true
  belongs_to :subscription
  belongs_to :bike
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

end
