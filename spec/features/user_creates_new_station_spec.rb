require_relative '../spec_helper'

  describe "when a user visits '/stations/index' " do
    it "they see a welcome message" do

        visit("/stations/index")

        within ("#greeting") do
          expect(page). to have_content("Stations in Greater San Francisco")
        end
    end

    # it "they can click on a create station button" do
    # visit "/"
    #
    # click_on "add Stations"
    # expect(page).to have_current_path "/stations/new"
    # end
    #
    # it "they can click view stations" do
    # visit "/"
    #
    # click_on "View Stations"
    # expect(page).to have_current_path "/stations/index"
  # end
end
