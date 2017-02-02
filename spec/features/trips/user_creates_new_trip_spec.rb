require 'spec_helper'

describe "when a user visits create trips" do
  it "they can create a new trip" do
    setup
    visit "/trips/new"

    fill_in "trip[duration]", :with => 90
    fill_in "trip[start_date]", :with => '10/10/2010'
    fill_in "trip[end_date]", :with => '10/10/2010'
    fill_in "trip[bike_id]", :with => "3"
    fill_in "trip[zip_code]", :with => "56789"
    fill_in "trip[subscription_id]", :with => '2'

    within ("#dropdown") do
      select "Station", from: "trip[end_station_id]", :match => :first
    end
    click_on("Add New Trip")
    expect(current_path).to eql "/trips/2"
    expect(page).to have_content "56789"
    expect(page).to have_content "2010-10-10"
  end
end

def setup
  city = City.create(name: 'Denver')
  bike = Bike.create(serial_no: '1')
  station = Station.create(name: 'Station', dock_count: 3, city: city, installation_date: '11/11/2011' )
  subs = Subscription.create(kind: 'Subscriber')

  trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                end_station: station, end_date: '10/12/2014', bike_id: bike.id,
                subscription_id: subs.id, zip_code: '45678')

end
