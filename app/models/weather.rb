require 'pry'

class Weather < ActiveRecord::Base
  has_many :trips

  def self.average_number_of_rides
    a = where('max_temp > ? AND max_temp < ?', 40, 50)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_rides_in_temp_range
    a = where('max_temp > ? AND max_temp < ?', 40, 50)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_rides_in_temp_range
    a = where('max_temp > ? AND max_temp < ?', 40, 50)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  # def self.average_number_of_rides_with_precip(range1, range2)
  #   a = Weather.where('precipitation > ? AND precipitation < ?', range1, range2)
  #   b = Trip.where(weather_id: a.all.ids)
  #   require "pry"; binding.pry
  #   b.count / a.count
  # end
  #
  # def self.max_number_rides_with_precip(range1, range2)
  #   a = Weather.where('precipitation > ? AND precipitation < ?', range1, range2)
  #   b = Trip.where(weather_id: a.all.ids)
  #   b.maximum(:id)
  # end
  #
  # def self.min_number_rides_with_precip(range1, range2)
  #   a = where('precipitation > ? AND precipitation < ?', range1, range2)
  #   b = Trip.where(weather_id: a.all.ids)
  #   b.minimum(:id)
  # end

  def self.average_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_wind
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

  def self.average_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.count / a.count
  end

  def self.max_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.maximum(:id)
  end

  def self.min_number_of_rides_with_visibility
    a = where('mean_visibility_miles > ? AND mean_visibility_miles < ?', 2, 6)
    b = Trip.where(weather_id: a.all.ids)
    b.minimum(:id)
  end

end
