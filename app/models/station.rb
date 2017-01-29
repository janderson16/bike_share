class Station < ActiveRecord::Base
 validates :name, :city, :installation_date, :dock_count, presence: true

  def self.total_number_of_stations
    Station.count
  end

  def self.average_number_of_bikes_available_per_station
    stations = Station.all
    total_docks = stations.map { |station| station.dock_count }
    dock = total_docks.reduce(:+) / Station.count
    dock
  end

  def self.most_bikes_available_at_station
    Station.maximum :dock_count
  end

  def self.fewest_bikes_available_at_station
    Station.minimum :dock_count
  end

  def self.station_with_max_bikes
    station = Station.where(dock_count: Station.maximum(:dock_count))
    station.map do |station|
    station.name
    end
  end

  def self.station_with_min_bikes
    station = Station.where(dock_count: Station.minimum(:dock_count))
    station.map do |station|
    station.name
    end
  end

  def self.oldest_station
    station = Station.where(installation_date: Station.minimum(:installation_date))
    station.map do |station|
    station.name
    end
  end


def self.newest_station
    station = Station.where(installation_date: Station.maximum(:installation_date))
    station.map do |station|
    station.name
    end
  end
end
