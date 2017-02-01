require 'spec_helper'

  describe "when a user visits trips/id/index" do
    it "they see a trip number" do
    Trip.create!(duration: '3', start_date: '4', start_station: '5',
                  end_station: '6', end_date: 'tomorrow', bike_id: '3',
                  subscription_type: 'yes', zip_code: '45678')

        visit("/trips/1/edit")

        within ("#greeting") do
          expect(page). to have_content("Update This Trip")
        end
    end

    it "they can edit the trip" do
      Trip.create!(duration: '3', start_date: '4', start_station: '5',
                  end_station: '6', end_date: 'tomorrow', bike_id: '3',
                  subscription_type: 'yes', zip_code: '45678')

      visit("/trips/1/edit")

      fill_in "trip[duration]", :with => "edit"
      fill_in "trip[start_station]", :with => "edit"
      fill_in "trip[start_date]", :with => 'edit'
      fill_in "trip[end_station]", :with => "edit"
      fill_in "trip[end_date]", :with => "edit"
      fill_in "trip[bike_id]", :with => "edit"
      fill_in "trip[zip_code]", :with => "testedit"
      fill_in "trip[subscription_type]", :with => "testedit"

      click_on("Update Trip")

      expect(current_path).to eql('/trips/1')
      within ("#table1")
      expect(page).to have_content("testedit")
    end

  end
