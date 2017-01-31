require_relative '../../spec_helper'

  describe "when a user visits '/stations/index'" do
    it "they see a welcome message" do

        visit("/stations/index")

        within ("#greeting") do
          expect(page). to have_content("Stations in Greater San Francisco")
        end
    end

    it "they can click view stations" do
      Station.create!(name: 'test', dock_count: 3, city: 'test', installation_date: 'Mon, 05 Aug 2013')
      visit "/stations/index"

    click_link "Edit"
    expect(page).to have_current_path "/stations/1/edit"
  end

    it "they can delete stations" do
      Station.create!(name: 'test', dock_count: 3, city: 'test', installation_date: 'Mon, 05 Aug 2013')
      visit "/stations/index"

      click_on "Delete"
      expect(page).to have_no_content("test")
    end

    it "they can click new station button" do
      visit "/stations/index"

      click_on "New"
      expect(page).to have_current_path "/stations/new"
    end

    it "user sees a list of stations and index is not empty" do
      Station.create!(name: 'test', dock_count: 3, city: 'test', installation_date: 'Mon, 05 Aug 2013')
      visit "/stations/index"

      expect(page).to have_content('test')
    end

    it "user clicks on specific station to view its show page" do
      Station.create!(name: "test", dock_count: 3, city: "test", installation_date: "Mon, 05 Aug 2013")
      visit "/stations/index"

      click_link "test"
      expect(page).to have_current_path "/stations/1"
    end



  end
