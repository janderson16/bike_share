require_relative '../models/station'

class Trip < ActiveRecord::Base
  validates :duration, :start_station_id, :start_date, :end_station_id, :end_date, :bike_id, :subscription_id, presence: true
  belongs_to :subscription
  belongs_to :bike
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

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
    station_num = self.group(:start_station_id).order('count(*)').pluck(:start_station_id).last
    Station.find("#{station_num}").name
  end

  def self.station_with_most_ending_rides
    station_num = self.group(:end_station_id).order('count(*)').pluck(:end_station_id).last
    Station.find("#{station_num}").name
  end

  def self.rides_per_month

    month_rides = self.group("DATE_TRUNC('month', start_date)").count
    month_rides.map do |m|
      "Month: #{m[0].strftime("%B")}, Count: #{m[1]}"
      # require "pry"; binding.pry
    end
  end

  def self.rides_per_year
    self.group("DATE_TRUNC('month', start_date)").count
  end
end
