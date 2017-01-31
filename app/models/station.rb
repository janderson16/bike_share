class Station < ActiveRecord::Base
 validates :name, :city_id, :installation_date, :dock_count, presence: true
 belongs_to :city
 
  def self.total_number_of_stations
    self.count
  end

  def self.average_number_of_bikes_available_per_station
    self.average(:dock_count).floor.to_i
  end

  def self.most_bikes_available_at_station
    self.maximum :dock_count
  end

  def self.fewest_bikes_available_at_station
    self.minimum :dock_count
  end

  def self.station_with_max_bikes
    station = self.where(dock_count: Station.maximum(:dock_count))
    station.pluck(:name)
  end

  def self.station_with_min_bikes
    station = self.where(dock_count: Station.minimum(:dock_count))
    station.pluck(:name)
  end

  def self.oldest_station
    station = self.where(installation_date: Station.minimum(:installation_date))
    station.pluck(:name)
  end


  def self.newest_station
    station = self.where(installation_date: Station.maximum(:installation_date))
    station.pluck(:name)
  end
end
