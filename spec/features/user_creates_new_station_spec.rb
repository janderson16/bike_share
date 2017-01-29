require_relative '../spec_helper'

describe "when a user visits create stations" do
  it "they can create a new station" do
    visit "/stations/new"

    fill_in "station[name]", :with => "Denver"
    fill_in "station[city]", :with => "Denver"
    fill_in "station[dock_count]", :with => 111
    fill_in "station[installation_date]", :with => "11/07/1999"

        within ("#greeting") do
          expect(page). to have_content("Stations in Greater San Francisco")
        end
    end


     it "they can click on a create station button" do
     visit "/"

     click_on "add Stations"
     expect(page).to have_current_path "/stations/new"
   end
     it "they can click view stations" do
     visit "/"

     click_on "View Stations"
     expect(page).to have_current_path "/stations/index"
   end

    expect(current_path).to eql "/stations/1"
    expect(page).to have_content "Denver"

  end

    click_on("Add New Station")

    expect(current_path).to eql "/stations/1"
    expect(page).to have_content "Denver"

  end
end
