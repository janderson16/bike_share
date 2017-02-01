require_relative '../../spec_helper'

describe "when user views individual trip" do
  it "they can view that trip" do
    trip = Trip.create!(duration: '3', start_date: '4', start_station: '5',
                  end_station: '6', end_date: 'tomorrow', bike_id: '3',
                  subscription_id: 'yes', zip_code: '45678')
    visit "/trips/#{trip.id}"

      expect(page).to have_content("tomorrow")
  end

  it "they can click on Edit" do
    trip = Trip.create!(duration: '3', start_date: '4', start_station: '5',
                  end_station: '6', end_date: 'tomorrow', bike_id: '3',
                  subscription_id: 'yes', zip_code: '45678')
    visit "/trips/#{trip.id}"

    click_on "Edit Trip"
    expect(current_path).to eql "/trips/#{trip.id}"
  end

    it "they can click on delete" do
      trip = Trip.create!(duration: '3', start_date: '4', start_station: '5',
                    end_station: '6', end_date: 'tomorrow', bike_id: '3',
                    subscription_id: 'yes', zip_code: '45678')
      visit "/trips/#{trip.id}"
      click_on "Delete Trip"
      expect(page).to have_current_path "/trips"
    end
end
