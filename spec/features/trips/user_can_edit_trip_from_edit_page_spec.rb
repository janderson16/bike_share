require_relative '../../spec_helper'

  describe "when a user visits trips/id/index" do
    it "they see a trip number" do
    Trip.create(duration: 1, start_date: "2012-02-03", start_station_id: 34,
                end_date: "2012-02-04", end_station_id: 33,
                bike_id: "123abc", subscription_id: "subscriber",
                zip_code: "12345")

        visit("/trips/1/edit")
        within ("#greeting") do
          expect(page).to have_content("Update This Trip")
        end
    end
  end

  describe "when a user clicks update" do
    it "they see updated trip " do
      setup
      visit("/trips/1/edit")
      click_on("Update Trip")
      expect(page).to have_current_path "/trips/1"

      within ("#trip_id") do
        expect(page).to have_content ("Trip 1")
      end

      within ("#table1") do
        expect(page).to have_content "Denver"
        expect(page).to have_content "111"
        expect(page).to have_content "2013-08-06"
      end
    end
  end
  
  def setup
    City.create(name: "Denver")
    City.create(name: "Boulder")
    Station.create(name: "Santiago" , dock_count: 20, city_id: City.first.id, installation_date: "11-07-2016")
    Station.create(name: "SF1" , dock_count: 22, city_id: City.last.id, installation_date: "11-07-2016")
    Trip.create(duration: 1, start_date: "2012-02-03", start_station_id: Station.first.id,
                end_date: "2012-02-04", end_station_id: Station.last.id,
                bike_id: "123abc", subscription_id: "subscriber",
                zip_code: "12345")

  end
