require 'spec_helper'

describe "when a user visits create stations" do
  it "they can create a new station" do
    visit "/stations/new"

    fill_in "station[name]", :with => "Station1"
    fill_in "station[name]", :with => "Denver"
    fill_in "station[dock_count]", :with => 111
    fill_in "station[installation_date]", :with => "2013-08-06"
    click_on("Add New Station")

    
    # expect(current_path).to eql "/stations/#{@station1}"

    within ("#heading") do
    expect(page).to have_content "Add a New Station"
    end
    within ("#table1") do
    expect(page).to have_content "Denver"
    expect(page).to have_content "111"
    expect(page).to have_content "2013-08-06"
    end
  end
end
