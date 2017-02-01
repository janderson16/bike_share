require_relative '../../spec_helper'

describe "when a user visit index weather conditions page" do
  it "they see a welcome message" do
    visit("stations/index")

    within("#greeting") do
      expect(page).to have_content("Weather Conditions Index")
    end

  it "they see index layout"
    within("#table") do
    expect(page).to have_content "Date"
    expect(page).to have_content "Max Temperature"
    expect(page).to have_content "Mean Temperature"
    expect(page).to have_content "Min Temperature"
    expect(page).to have_content "Mean Humidity"
    expect(page).to have_content "Mean Visibility"
    expect(page).to have_content "Mean Wind Speed"
    expect(page).to have_content "Percipitation"
  end

  it "they can click conditions for more information" do 
    Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

    visit "/stations/index"

    click_link "11072016"
    expect(page).to have_current_path "/conditions/1/"
  end

  it "they can delete a weather condition" do
    Condition.create(date:"11072016", max_temperature:"9000", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")
    
    visit "/stations/index"

    click_on "Delete"
    expect(page).to have_no_content("9000")
  end

  it "user sees a list of conditions" do
    Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")
    visit "/conditions/index"

    expect(page).to have_content("90")
  end
end
