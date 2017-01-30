require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'

file = './db/csv/station.csv'

csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|

  Station.create!(name: StationName.find_or_create_by(station_name: row[1]), dock_count: row[4], city: City.find_or_create_by(name: row[5]), installation_date: Date.strptime(row[6], '%m/%d/%Y'))

end


file1 = './db/csv/trip.csv'

csv_text = File.read(file1)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
start_date = Date.strptime(row[2], '%m/%d/%Y %H:%M:%S')
end_date = Date.strptime(row[5], '%m/%d/%Y %H:%M:%S')
  Trip.create!(duration: row[1], start_date: start_date, start_station_name: row[3], start_station_id: row[4], end_date: end_date, end_station_name: row[6], end_station_id: row[7], bike_id: row[8], subscription_type: row[9], zip_code: row[10])

end
