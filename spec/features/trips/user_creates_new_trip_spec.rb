require 'spec_helper'

describe "when a user visits create trips" do
  it "they can create a new trip" do
    visit "/trips/new"

    fill_in "trip[duration]", :with => "test"
    fill_in "trip[start_station]", :with => "Denver"
    fill_in "trip[start_date]", :with => '111'
    fill_in "trip[end_station]", :with => "Thornton"
    fill_in "trip[end_date]", :with => "Thornton"
    fill_in "trip[bike_id]", :with => "3"
    fill_in "trip[zip_code]", :with => "56789"
    fill_in "trip[subscription_type]", :with => "3"

    click_on("Add New Trip")
    expect(current_path).to eql "/trips/1"
    expect(page).to have_content "Station1"
end
  end
