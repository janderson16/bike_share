require 'spec_helper'

  describe "when a user visits '/trips/index'" do
    it "they see a welcome message" do

        visit("/trips")

        within ("#greeting") do
          expect(page). to have_content("Trip Index")
        end
    end

    it "they can click view trips" do
      setup
      visit "/trips"

    click_link "Edit"
    expect(page).to have_current_path "/trips/1/edit"
  end

    it "they can delete trips" do
    setup
      visit "/trips"

      click_on "Delete"
      expect(page).not_to have_content("tomorrow")
      expect(page).not_to have_content("Trip 1")
      expect(page).not_to have_content("Denver")
      expect(page).not_to have_content("11/11/2011")
    end

    it "they can click new station button" do
      visit "/trips"

      click_on "New"
      expect(page).to have_current_path "/trips/new"
    end

    it "user sees a list of trips and index is not empty" do
    setup
      visit "/trips"
      expect(page).to have_content("Trip 1")
      expect(page).to have_content("Station")
      expect(page).to have_content("45678")
      expect(page).to have_content("2014-12-10")
    end

    it "user clicks on specific station to view its show page" do
    setup
      visit "/trips"

      click_link "Trip 1"
      expect(page).to have_current_path("/trips/1")
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
