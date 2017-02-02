require 'spec_helper'

describe "when a user visits edit weather conditions page" do
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
    end
  end


