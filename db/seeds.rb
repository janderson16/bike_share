require 'csv'
require './app/models/station.rb'

file = './db/csv/station.csv'

csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Station.create!(name: row[1], dock_count: row[4], city: row[5], installation_date: row[6])
end
