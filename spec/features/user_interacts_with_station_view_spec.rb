 require_relative '../spec_helper'

describe "when user views individual station" do
  it "they can edit/delete that station" do

    station = Station.create(name:"Denver", city:"Denver", dock_count:111, installation_date: "Mon, 05 Aug 2013")

      visit "/stations/#{station.id}"

    within ("#station_id") do
      expect(page).to have_content("Denver")
    end
  end

  it "they can click on edit button" do
    station = Station.create(name:"Denver", city:"Denver", dock_count:111, installation_date:"Mon, 05 Aug 2013")
      visit "/stations/#{station.id}"

    click_on "Edit Station"
    expect(current_path).to eql "/stations/#{station.id}"
  end

  it "they can click on delete" do
    station = Station.create(name:"Denver", city:"Denver", dock_count:111, installation_date:"Mon, 05 Aug 2013")
    visit "/stations/#{station.id}"
    click_on "Delete Station"
    expect(page).to have_current_path "/stations/index"
  end
end
