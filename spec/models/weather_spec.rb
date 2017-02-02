require "spec_helper"
require 'pry'

describe ".average_rides_in_temp_range" do
  it "returns .average_rides_in_temp_range" do
    setup
    expect(Weather.average_number_of_rides(40, 50)).to eql(1)
    end
  end

describe ".max_number_rides_in_temp_range" do
  it "returns .max_number_rides_in_temp_range" do
    setup
    expect(Weather.max_number_rides_in_temp_range(40, 50)).to eql(6)
    end
  end

  describe ".min_number_rides_in_temp_range" do
    it "returns .min_number_rides_in_temp_range" do
      setup
      expect(Weather.min_number_rides_in_temp_range(40, 50)).to eql(2)
      end
    end

  describe ".average_number_of_rides_with_precip" do
    it "returns .average_number_of_rides_with_precip" do
      setup
      expect(Weather.average_number_of_rides_with_precip(0.0, 0.5)).to eql(1)
      end
    end

  describe ".max_number_rides_with_precip" do
    it "returns .max_number_rides_with_precip" do
      setup
      expect(Weather.max_number_rides_with_precip(0.0, 0.5)).to eql(1)
      end
    end

  describe ".min_number_rides_with_precip" do
    it "returns .min_number_rides_with_precip" do
      setup
      expect(Weather.min_number_rides_with_precip(0.0, 0.5)).to eql(1)
      end
    end

  describe ".average_number_of_rides_with_wind" do
    it "returns .average_number_of_rides_with_wind" do
      setup
      expect(Weather.average_number_of_rides_with_wind(2, 6)).to eql(1)
      end
    end

  describe ".max_number_of_rides_with_wind" do
    it "returns .max_number_of_rides_with_wind" do
      setup
      expect(Weather.max_number_of_rides_with_wind(2, 6)).to eql(6)
      end
    end

    describe ".min_number_of_rides_with_wind" do
      it "returns .min_number_of_rides_with_wind" do
        setup
        expect(Weather.min_number_of_rides_with_wind(2, 6)).to eql(1)
        end
      end

    describe ".average_number_of_rides_with_visibility" do
      it "returns .average_number_of_rides_with_visibility" do
        setup
        expect(Weather.average_number_of_rides_with_visibility(2, 6)).to eql(1)
        end
      end

    describe ".max_number_of_rides_with_visibility" do
      it "returns .max_number_of_rides_with_visibility" do
        setup
        expect(Weather.max_number_of_rides_with_visibility(2, 6)).to eql(6)
        end
      end

    describe ".min_number_of_rides_with_visibility" do
      it "returns .min_number_of_rides_with_visibility" do
        setup
        expect(Weather.min_number_of_rides_with_visibility(2, 6)).to eql(1)
        end
      end
  #
def setup
  bike = Bike.create(serial_no: "12365")
  subscription = Subscription.create(kind: "Subscriber")
  city = City.create(name: "Denver")
  station = city.stations.create(name: "Santiago", dock_count: 20, installation_date: "11-07-2016")
  weather_1 = Weather.create(max_temp: 59, min_temp: 40, mean_temp: 45, mean_humidity: 50, mean_visibility_miles: 5, mean_wind_speed: 3, precipitation: 1.0, date: "2012-02-04")
  weather_2 = Weather.create(max_temp: 45, min_temp: 41, mean_temp: 50, mean_humidity: 51, mean_visibility_miles: 4, mean_wind_speed: 4, precipitation: 0.5, date: "2012-02-04")
  weather_3 = Weather.create(max_temp: 41, min_temp: 51, mean_temp: 50, mean_humidity: 51, mean_visibility_miles: 3, mean_wind_speed: 5, precipitation: 2.5, date: "2012-02-04")
  weather_4 = Weather.create(max_temp: 44, min_temp: 41, mean_temp: 50, mean_humidity: 51, mean_visibility_miles: 10, mean_wind_speed: 10, precipitation: 1.5, date: "2012-02-04")
  weather_1.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "bike.id45")
  weather_2.trips.create(duration: 60, start_date: "2012-02-09", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "34567")
  weather_3.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "12345")
  weather_4.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "12345")
  weather_2.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "12345")
  weather_2.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
              end_date: "2012-02-04", end_station_id: station.id,
              bike_id: bike.id, subscription_id: subscription.id,
              zip_code: "12345")
end
