require 'spec_helper'

describe "when a user visits edit weather weathers page" do
  it "they can see" do
    Weather.create(date:"11072016", max_temp:"90", mean_temp:"50", min_temp:"0", mean_humidity:"10", mean_visibility_miles:"10", mean_wind_speed:"25", precipitation:"10")

    visit "/conditions/1/edit"

    within ("#greeting") do
      expect(page).to have_content "Update Weather Records"
    end

    within (".maindiv") do
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

  it "they can update information for weather conditions" do

    fill_in "weather[date]", :with => "2013-08-10"
    fill_in "weather[max_temp]", :with => "10"
    fill_in "weather[mean_temp]", :with => "15"
    fill_in "weather[min_temp]", :with => "20"
    fill_in "weather[mean_humidity]", :with => "25"
    fill_in "weather[mean_visibility_miles]", :with => "30"
    fill_in "weather[mean_wind_speed]", :with => "35"
    fill_in "weather[precipitation]", :with => "40"

    click_on("Update Conditions")
    weather.create(date:"2013-08-10", max_temp:"10", mean_temp:"15", min_temp:"20", mean_humidity:"25", mean_visibility_miles:"30", mean_wind_speed:"35", precipitation:"40")
    expect(page).to have_current_path "/weathers/1"

    within ("greeting") do
      expect(page).to have_content ("2013-08-10")
    end

    within ("table1") do
      expect(page).to have_content "10"
    expect(page).to have_content "15"
    expect(page).to have_content "20"
    expect(page).to have_content "25"
    expect(page).to have_content "30"
    expect(page).to have_content "35"
    expect(page).to have_content "40"
    end
  end
end
