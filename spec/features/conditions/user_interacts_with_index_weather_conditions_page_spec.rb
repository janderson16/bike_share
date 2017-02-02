require 'spec_helper'

describe "when a user visit index weather conditions page" do
  it "they see a welcome message" do
    visit("/conditions")

    within("#greeting") do
      expect(page).to have_content("Weather Index")
    end
  end

describe "when a user visit index weather conditions page" do
  it "they see index layout" do
    within(".maindiv") do
    expect(page).to have_content "Date"
    expect(page).to have_content "Max Temperature"
    expect(page).to have_content "Mean Temperature"
    expect(page).to have_content "Min Temperature"
    expect(page).to have_content "Mean Humidity"
    expect(page).to have_content "Mean Visibility"
    expect(page).to have_content "Mean Wind Speed"
    expect(page).to have_content "Precipitation"
  end
end



  

  it "user sees a list of conditions" do
    Weather.create(date:"11072016", max_temp:"90", mean_temp:"50", min_temp:"0", mean_humidity:"10", mean_visibility_miles:"10", mean_wind_speed:"25", precipitation:"10")
    visit "/conditions"

    expect(page).to have_content("90")
  end
end
end
