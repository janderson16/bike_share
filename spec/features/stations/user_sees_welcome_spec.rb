require 'spec_helper'

  describe "when a user visits '/' " do
    it "they see a welcome message" do

        visit("/")

        within ("#greeting") do
          expect(page).to have_content("Stations in Greater San Francisco")
        end
    end

    it "they can click on a create station button" do
      visit "/" do

    click_button("Add New Station")
    expect(page).to have_current_path "/stations/new"
        end
    end

    it "they can click view stations" do
    visit "/" do

    click_button("View All Stations")
    expect(page).to have_current_path "/stations/index"
    end
  end
end
