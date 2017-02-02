require 'pry'

class Weather < ActiveRecord::Base
  has_many :trips

  def self.average_number_of_rides
    a = where('max_temp > ? AND max_temp < ?', 50, 60)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_rides_in_temp_range
    a = where('max_temp > ? AND max_temp < ?', 50, 60)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_rides_in_temp_range
    a = where('max_temp > ? AND max_temp < ?', 50, 60)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_precip
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_rides_with_precip
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_rides_with_precip
    a = where('precipitation > ? AND precipitation < ?', 0.0, 0.5)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 0, 4)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 0, 4)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 0, 4)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 5, 11)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 5, 11)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 5, 11)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

end
