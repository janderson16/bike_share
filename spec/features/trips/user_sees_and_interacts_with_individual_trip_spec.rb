require 'spec_helper'

describe "when user views individual trip" do
  it "they can view that trip" do
    station = Station.find_or_create_by(id: 5)
    bike = Bike.find_or_create_by(id: 50).id
    subs = Subscription.find_or_create_by(id: 1).id

    trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                  end_station: station, end_date: '10/12/2014', bike_id: bike,
                  subscription_id: subs, zip_code: '45678')
    visit "/trips/#{trip.id}" do

      expect(page).to have_content('1')
      expect(page).to have_content("2014/10/12")
      expect(page).to have_content("50")
      expect(page).to have_content("Customer")
      expect(page).to have_content("240")

    end


  end

  it "they can click on Edit" do
    station = Station.find_or_create_by(id: 5)
    bike = Bike.find_or_create_by(id: 50).id
    subs = Subscription.find_or_create_by(id: 1).id

    trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                  end_station: station, end_date: '10/12/2014', bike_id: bike,
                  subscription_id: subs, zip_code: '45678')
    visit "/trips/#{trip.id}" do

    click_on "Edit Trip"
    expect(current_path).to eql "/trips/#{trip.id}"
    end
  end

    it "they can click on delete" do
      station = Station.find_or_create_by(id: 5)
      bike = Bike.find_or_create_by(id: 50).id
      subs = Subscription.find_or_create_by(id: 1).id

      trip = Trip.create!(duration: 240, start_date: '10/12/2014', start_station: station,
                    end_station: station, end_date: '10/12/2014', bike_id: bike,
                    subscription_id: subs, zip_code: '45678')
      visit "/trips/#{trip.id}"
      click_on "Delete Trip"
      expect(page).to have_current_path "/trips"
      expect(page).to have_content("Index")
      expect(page).not_to have_content("45678")
      expect(page).not_to have_content("240")
      expect(page).not_to have_content("10/12/2014")
    end
end
