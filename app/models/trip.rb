require_relative '../models/station'

class Trip < ActiveRecord::Base
  validates :duration, :start_station_id, :start_date, :end_station_id, :end_date, :bike_id, :subscription_id, presence: true
  belongs_to :subscription
  belongs_to :bike, class_name: 'Bike', foreign_key: 'bike_id'
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'
  has_many :stations
  belongs_to :weather

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
    end
  end

  def self.rides_per_year
    year_rides = self.group("DATE_TRUNC('year', start_date)").count
    year_rides.map do |m|
      "Year: #{m[0].strftime("%Y")}, Count: #{m[1]}"
    end
  end

  def self.most_ridden_bike
    self.group('bike_id').order('count(*)').pluck(:bike_id).first
  end

  def self.least_ridden_bike
    self.group('bike_id').order('count(*)').pluck(:bike_id).last
  end

  def self.subscriber_count
    self.where("subscription_id = '1'").count
  end

  def self.customer_count
    self.where("subscription_id = '2'").count
  end


  def self.most_common_date
    date = self.group('start_date').order('count(*)').pluck(:start_date).last
    date.strftime("%B %e, %Y")
  end

  def self.least_common_date
    date = self.group('start_date').order('count(*)').pluck(:start_date).first
    date.strftime("%B %e, %Y")
  end

  def self.most_common_date_count
    date = self.group(:start_date).order('count(*)').pluck(:start_date).last
    self.where(start_date: "#{date}").count
  end

  def self.least_common_date_count
    date = self.group(:start_date).order('count(*)').pluck(:start_date).first
    self.where(start_date: "#{date}").count
  end

  def self.subscriber_breakout
    "#{((subscriber_count.to_f)/ ((subscriber_count.to_f) + (customer_count.to_f)) *100).to_i}%"
  end

  def self.most_rides_weather
    Weather.where(date: most_common_date).first
  end

  def self.least_rides_weather
    Weather.where(date: least_common_date).first
  end
end
