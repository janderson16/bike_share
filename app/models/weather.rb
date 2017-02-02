require 'pry'

class Weather < ActiveRecord::Base
  has_many :trips

  def self.average_number_of_rides(range1, range2)
    a = where('max_temp > ? AND max_temp < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_rides_in_temp_range(range1, range2)
    a = where('max_temp > ? AND max_temp < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_rides_in_temp_range(range1, range2)
    a = where('max_temp > ? AND max_temp < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_precip(range1, range2)
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_rides_with_precip(range1, range2)
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_rides_with_precip(range1, range2)
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_wind(range1, range2)
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_wind(range1, range2)
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_wind(range1, range2)
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_visibility(range1, range2)
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_visibility(range1, range2)
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_visibility(range1, range2)
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', range1, range2)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

end
