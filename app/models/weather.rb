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

  def self.min_number_of_rides_with_wind(low, high)
    a = where('mean_wind_speed > ? AND mean_wind_speed < ?', low, high)
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
  # def self.average_number_of_rides
  #   a = where('max_temp > ? AND max_temp < ?',60 ,70)
  #   b = Trip.where(weather_id: a.all.id)
  #   b.count
  # end
  # def self.average_number_of_rides
  #   a = where('max_temp > ? AND max_temp < ?',70 ,80)
  #   b = Trip.where(weather_id: a.all.id)
  #   b.count
  # end
  #
  # def self.highest_number_of_rides
  #
  # end
  #
  # def self.lowest_number_of_rides
  #
  # end

  #temp degrees
  # average number of rides 40-50, 50-60, 60-70, 70-80, 80-90
  # highest number of rides 40-50, 50-60, 60-70, 70-80, 80-90
  # lowest number of rides 40-50, 50-60, 60-70, 70-80, 80-90

  #rain inches
  # average number of rides 0.0-0.5, 0.5-1.0, 1.0-1.5, 1.5 - 2.0,
  # highest number of rides 0.0-0.5, 0.5-1.0, 1.0-1.5, 1.5 - 2.0,
  # lowest number of rides 0.0-0.5, 0.5-1.0, 1.0-1.5, 1.5 - 2.0,

  #wind mph
  # average number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24
  # highest number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24
  # lowest number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24

  #visibility miles
  # average number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24
  # highest number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24
  # lowest number of rides 0-4, 4-8, 8-12, 12-16, 16-20, 20-24


end
