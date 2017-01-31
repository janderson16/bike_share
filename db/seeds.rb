require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/city.rb'
require './app/models/subscription.rb'
require './app/models/bike.rb'
require 'activerecord-import'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'
require 'pry'
require 'pry-rescue'
require 'pry-stack_explorer'

file = './db/csv/station.csv'

csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Station.create!(name: row[1], dock_count: row[4],
                  city: City.find_or_create_by(name: row[5]),
                  installation_date: Date.strptime(row[6], '%m/%d/%Y'))

end

trips = []
Pry::rescue{CSV.foreach('db/csv/trip.csv', headers: true) do |row|
  start_date = Time.strptime(row[2], '%m/%d/%Y')
  end_date = Time.strptime(row[5], '%m/%d/%Y')
  trips << Trip.new(
      duration:           row[1],
      start_date:         start_date,
      start_station_id:   Station.find_by(name: row[3]).id,
      end_date:           end_date,
      end_station_id:     Station.find_by(name: row[6]).id,
      bike_id:            Bike.find_or_create_by(serial_no: row[8]).id,
      subscription_id:    Subscription.find_or_create_by(kind: row[9]).id,
      zip_code:           row[10]
                    )
  if trips.size == 10000
    Trip.import trips
    trips = []
  end
end}

# batch,batch_size = [], 1_000
# CSV.foreach("/data/new_products.csv", :headers => true) do |row|
#   batch << Product.new(row)
#
#   if batch.size >= batch_size
#     Product.import batch
#     batch = []
#   end
# end
# Product.import batch
#
# file1 = './db/csv/trip.csv'
#
# csv_text = File.read(file1)
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   start_date = Time.strptime(row[2], '%m/%d/%Y')
#   end_date = Time.strptime(row[5], '%m/%d/%Y')
#
#   Trip.create!(duration: row[1], start_date: start_date,
#               start_station_id: Station.find_or_create_by(name: row[3]).id,
#               end_date: end_date, end_station_id: Station.find_by(name: row[6]).id,
#               bike_id: row[8],
#               subscription_type: Subscription.find_or_create_by(subscription_type: row[9]),
#               zip_code: row[10])
# end
