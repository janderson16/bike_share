class Station < ActiveRecord::Base
 validates :name, :city_id, :installation_date, :dock_count, presence: true
 belongs_to :city
 has_many :trips
 has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id'
 has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id'


  def self.total_number_of_stations
    self.count
  end

  def self.average_number_of_bikes_available_per_station
    self.average(:dock_count).to_i
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


  def self.rides_started_here
    self.start_trips.count
  end

  def self.rides_ending_here
    self.end_trips.count
  end

  def self.most_common_destination
    self.start_trips.group('end_station_id', 'id').order('count(*)').first.end_station.name
  end

  def self.most_common_origin
    self.end_trips.group('start_station_id', 'id').order('count(*)').first.start_station.name
  end

  def self.most_common_zip_code_of_users
    self.start_trips.group('zip_code', 'id').order('count(*)').first.zip_code
  end

  def self.most_common_bike_starting_here
    self.start_trips.group('bike_id', 'id').order('count(*)').first.bike_id
  end


end
