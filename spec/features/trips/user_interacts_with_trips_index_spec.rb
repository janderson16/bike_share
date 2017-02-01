require 'spec_helper'

  describe "when a user visits '/trips/index'" do
    it "they see a welcome message" do

        visit("/trips")

        within ("#greeting") do
          expect(page). to have_content("Trip Index")
        end
    end

    it "they can click view trips" do
      Trip.create!(duration: 30, start_date: "10-10-2011", start_station_id: 1,
                    end_station_id: 2, end_date: "10-11-2011", bike_id: '12323',
                    subscription_id: 'subscriber', zip_code: '45678')
      visit "/trips"

    click_link "Edit"
    expect(page).to have_current_path "/trips/1/edit"
  end

    it "they can delete trips" do
      Trip.create!(duration: 30, start_date: "10-10-2011", start_station_id: 1,
                    end_station_id: 2, end_date: "10-11-2011", bike_id: '12323',
                    subscription_id: 'subscriber', zip_code: '45678')
      visit "/trips"

      click_on "Delete"
      expect(page).to have_no_content("tomorrow")
    end

    it "they can click new station button" do
      visit "/trips"

      click_on "New"
      expect(page).to have_current_path "/trips/new"
    end

    it "user sees a list of trips and index is not empty" do
      Trip.create!(duration: 30, start_date: "10-10-2011", start_station_id: 1,
                    end_station_id: 2, end_date: "10-11-2011", bike_id: '12323',
                    subscription_id: 'subscriber', zip_code: '45678')
      visit "/trips"

      expect(page).to have_content("Trip 1")
    end

    it "user clicks on specific station to view its show page" do
      Trip.create!(duration: 30, start_date: "10-10-2011", start_station_id: 1,
                    end_station_id: 2, end_date: "10-11-2011", bike_id: '12323',
                    subscription_id: 'subscriber', zip_code: '45678')
      visit "/trips"

      click_link "Trip 1"
      expect(page).to have_current_path("/trips/1")
    end

  end
