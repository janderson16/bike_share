require 'csv'
require 'pry-rescue'
require 'pry-stack_explorer'
require './app/models/weather.rb'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/city.rb'
require './app/models/subscription.rb'
require './app/models/bike.rb'
require 'activerecord-import'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'

file = './db/csv/station.csv'
csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
Pry::rescue{csv.each do |row|
  Station.create!(name: row[1], dock_count: row[4],
                  city: City.find_or_create_by(name: row[5]),
                  installation_date: Date.strptime(row[6], '%m/%d/%Y'))

end}

weather_file = './db/csv/weather.csv'
weather = File.read(weather_file)
weather_cells = CSV.parse(weather, headers: true)
Pry::rescue{weather_cells.each do |row|
  Weather.create!(
      max_temp:               row[1].to_i,
      mean_temp:              row[2].to_i,
      mean_humidity:          row[8].to_i,
      mean_visibility_miles:  row[14].to_i,
      mean_wind_speed:        row[17].to_i,
      precipitation:          row[19].to_i,
      date:                   Date.strptime(row[0], '%m/%d/%Y')
                  )
  end}

trips = []
Pry::rescue{CSV.foreach('./db/csv/trip.csv', headers: true) do |row|
  start_date = Date.strptime(row[2], '%m/%d/%Y')
  end_date = Date.strptime(row[5], '%m/%d/%Y')
  trips << Trip.new(
      duration:           row[1],
      start_date:         start_date,
      start_station_id:   Station.find_by(name: row[3]).id,
      end_date:           end_date,
      end_station_id:     Station.find_by(name: row[6]).id,
      bike_id:            Bike.find_or_create_by(serial_no: row[8]).id,
      subscription_id:    Subscription.find_or_create_by(kind: row[9]).id,
      zip_code:           row[10],
      weather_id:         Weather.find_by(date: start_date).id
                    )
  if trips.size == 10000
    Trip.import trips
    trips = []
  end
end}
