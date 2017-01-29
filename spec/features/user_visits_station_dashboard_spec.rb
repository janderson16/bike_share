require_relative '../spec_helper'

describe "user visits station dashboard" do
  it "they see station data" do
    Station.create!(name: 'test', dock_count: 4, city: 'test', installation_date: "Mon, 05 Aug 2013")
    Station.create!(name: 'Denver', dock_count: 6, city: 'Denver', installation_date: "Mon, 05 Aug 2013")


    visit '/home/station_dashboard'

    expect(page).to have_content("2")
    expect(page).to have_content("5")
    expect(page).to have_content("6")
    expect(page).to have_content("4")
    expect(page).to have_content("Denver")
    expect(page).to have_content("test")

  end
end
