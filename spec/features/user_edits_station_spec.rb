require_relative '../spec_helper'

describe "when a user edits current station" do
  it "they can click update information for a station" do
    Station.create!(name: 'test', dock_count: 3, city: 'test', installation_date: "Mon, 05 Aug 2013")

    visit "/stations/1/edit"

    fill_in "station[name]", :with => "SF1"
    fill_in "station[city]", :with => "Denver"
    fill_in "station[dock_count]", :with => 111
    fill_in "station[installation_date]", :with => "Mon, 05 Aug 2014"

    click_on("Update Station")

    expect(page).to have_current_path "/stations/1"

    visit "/stations/1"

    expect(page).to have_content ("SF1")
    expect(page).to have_content ("Denver")
    expect(page).to have_content (111)
  end
end
