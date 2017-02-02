require 'spec_helper'

describe "when user views individual trip" do
  it "they can view that trip" do
    city = City.create(name: 'Denver')
    bike = Bike.create(serial_no: '1')
    station = Station.create(name: 'Station', dock_count: 3, city: city, installation_date: '11/11/2011' )
    subs = Subscription.create(kind: 'Subscriber')

    trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                  end_station: station, end_date: '10/12/2014', bike_id: bike.id,
                  subscription_id: subs.id, zip_code: '45678')
    visit "/trips/#{trip.id}" do

      expect(page).to have_content('1')
      expect(page).to have_content("2014/10/12")
      expect(page).to have_content("50")
      expect(page).to have_content("Customer")
      expect(page).to have_content("240")

    end
  end

  it "they can click on Edit" do
    city = City.create(name: 'Denver')
    bike = Bike.create(serial_no: '1')
    station = Station.create(name: 'Station', dock_count: 3, city: city, installation_date: '11/11/2011' )
    subs = Subscription.create(kind: 'Subscriber')

    trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                  end_station: station, end_date: '10/12/2014', bike_id: bike.id,
                  subscription_id: subs.id, zip_code: '45678')
    visit "/trips/#{trip.id}" do

    click_on "Edit Trip"
    expect(current_path).to eql "/trips/#{trip.id}"
    end
  end

    it "they can click on delete" do
      city = City.create(name: 'Denver')
      bike = Bike.create(serial_no: '1')
      station = Station.create(name: 'Station', dock_count: 3, city: city, installation_date: '11/11/2011' )
      subs = Subscription.create(kind: 'Subscriber')

      trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                    end_station: station, end_date: '10/12/2014', bike_id: bike.id,
                    subscription_id: subs.id, zip_code: '45678')
      visit "/trips/#{trip.id}"
      click_on "Delete Trip"
      expect(page).to have_current_path "/trips"
      expect(page).to have_content("Index")
      expect(page).not_to have_content("45678")
      expect(page).not_to have_content("240")
      expect(page).not_to have_content("10/12/2014")
    end
end
