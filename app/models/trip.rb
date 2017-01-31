class Trip < ActiveRecord::Base
  validates :duration, :start_station_name, :start_date, :end_station_name, :end_date, :bike_id, :subscription_type, presence: true

  def self.average_duration_of_ride
    self.average :duration
  end

  def self.longest_ride
    self.maximum :duration
  end

  def self.shortest_ride
    self.minimum :duration
  end

  def self.station_with_most_starting_rides
    Trip.group(:start_station_id).order
    # station = self.where(: Trip.maximum(:dock_count))
    # station.pluck(:name)
  end
end
