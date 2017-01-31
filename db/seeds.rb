require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/city.rb'
require './app/models/subscription.rb'

file = './db/csv/station.csv'

csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Station.create!(name: row[1], dock_count: row[4],
                  city: City.find_or_create_by(name: row[5]),
                  installation_date: Date.strptime(row[6], '%m/%d/%Y'))

end


file1 = './db/csv/trip.csv'

csv_text = File.read(file1)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  start_date = Time.strptime(row[2], '%m/%d/%Y')
  end_date = Time.strptime(row[5], '%m/%d/%Y')
  if row[6] == "Broadway at Main"
     row[6] = "Stanford in Redwood City"
  end
  if row[6] == "San Jose Government Center"
    row[6] = "Santa Clara County Civic Center"
  end
  if row[3] == "Broadway at Main"
     row[3] = "Stanford in Redwood City"
  end
  if row[3] == "San Jose Government Center"
    row[3] = "Santa Clara County Civic Center"
  end
  Trip.create!(duration: row[1], start_date: start_date,
              start_station_id: Station.find_or_create_by(name: row[3]).id,
              end_date: end_date, end_station_id: Station.find_by(name: row[6]).id,
              bike_id: row[8],
              subscription_type: Subscription.find_or_create_by(subscription_type: row[9]),
              zip_code: row[10])

end
