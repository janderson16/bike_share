require "spec_helper"

describe ".average_rides_in_temp_range" do
  it "returns .average_rides_in_temp_range" do
    bike = Bike.create(serial_no: "123abc")
    subscription = Subscription.create(kind: "Subscriber")
    city = City.create(name: "Denver")
    station = city.stations.create(name: "Santiago", dock_count: 20, installation_date: "11-07-2016")
    weather_1 = Weather.create(max_temp: 51, mean_temp: 45, mean_humidity: 50, mean_visibility_miles: 5, mean_wind_speed: 3, precipitation: 0, date: "2012-02-03")
    weather_2 = Weather.create(max_temp: 45, mean_temp: 50, mean_humidity: 51, mean_visibility_miles: 4, mean_wind_speed: 1, precipitation: 0.5, date: "2012-02-04")
    weather_1.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
                end_date: "2012-02-04", end_station_id: station.id,
                bike_id: bike.id, subscription_id: subscription.id,
                zip_code: "12345")
    weather_2.trips.create(duration: 60, start_date: "2012-02-09", start_station_id: station.id,
                end_date: "2012-02-09", end_station_id: station.id,
                bike_id: bike.id, subscription_id: subscription.id,
                zip_code: "34567")
    weather_2.trips.create(duration: 90, start_date: "2012-02-03", start_station_id: station.id,
                end_date: "2012-02-04", end_station_id: station.id,
                bike_id: bike.id, subscription_id: subscription.id,
                zip_code: "12345")


  expect "1.5", Weather.average_number_of_rides
  end
end
