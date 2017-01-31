require_relative '../../spec_helper'

describe "when a user visits create stations" do
  it "they can create a new station" do
    visit "/stations/new"

    fill_in "station[name]", :with => "Station1"
    fill_in "station[city]", :with => "Denver"
    fill_in "station[dock_count]", :with => 111
    fill_in "station[installation_date]", :with => "2013-08-06"
    click_on("Add New Station")

    station = Station.create(name:"Station1", city:"Denver", dock_count:111, installation_date:"2013-08-06")
    expect(current_path).to eql "/stations/1"

    within ("#heading") do 
    expect(page).to have_content "Station1"
    end
    within ("#table1") do
    expect(page).to have_content "Denver"
    expect(page).to have_content "111"
    expect(page).to have_content "2013-08-06"
    end
  end
end
