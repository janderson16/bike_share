require 'spec_helper'

describe "when a user visits create trips" do
  it "they can create a new trip" do
    setup
    visit "/trips/new"

    fill_in "trip[duration]", :with => 90
    fill_in "trip[start_date]", :with => 10-10-2010
    fill_in "trip[end_date]", :with => 10-10-2010
    fill_in "trip[bike_id]", :with => "3"
    fill_in "trip[zip_code]", :with => "56789"
    fill_in "trip[subscription_id]", :with => "subscriber"

    within ("#dropdown") do
      select "Santiago", from: "trip[end_station_id]", :match => :first
    end
    click_on("Add New Trip")
    expect(current_path).to eql "/trips/#{@trip1}"
  end
end

def setup
  City.create(name: "Denver")
  City.create(name: "Boulder")
  Station.create(name: "Santiago" , dock_count: 20, city_id: City.first.id, installation_date: "11-07-2016")
  Station.create(name: "SF1" , dock_count: 22, city_id: City.last.id, installation_date: "11-07-2016")
  Trip.create(duration: 90, start_date: "2012-02-03", start_station_id: Station.first.id,
              end_date: "2012-02-04", end_station_id: Station.last.id,
              bike_id: "123abc", subscription_id: "subscriber",
              zip_code: "12345")

end
