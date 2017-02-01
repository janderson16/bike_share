require 'spec_helper'

describe "when a user visits edit weather weathers page" do
  it "they can see" do
    Weather.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

    visit "/weathers/1/edit"

    within ("#heading") do
      expect(page).to have_content "Weather weathers"
    end
    within ("#div1") do
    expect(page).to have_content "Date"
    expect(page).to have_content "Max Temperature"
    expect(page).to have_content "Mean Temperature"
    expect(page).to have_content "Min Temperature"
    expect(page).to have_content "Mean Humidity"
    expect(page).to have_content "Mean Visibility"
    expect(page).to have_content "Mean Wind Speed"
    expect(page).to have_content "Percipitation"
    end
  end

  it "they can update information for weather weathers" do

    fill_in "weather[date]", :with => "2013-08-10"
    fill_in "weather[max_temperature]", :with => "10"
    fill_in "weather[mean_temperature]", :with => "15"
    fill_in "weather[min_temperature]", :with => "20"
    fill_in "weather[mean_humidity]", :with => "25"
    fill_in "weather[mean_visibility]", :with => "30"
    fill_in "weather[mean_wind_speed]", :with => "35"
    fill_in "weather[percipitation]", :with => "40"

    click_on("Update Weather weathers")
    weather.create(date:"2013-08-10", max_temperature:"10", mean_temperature:"15", min_temperature:"20", mean_humidity:"25", mean_visibility:"30", mean_wind_speed:"35", precipitation:"40")
    expect(page).to have_current_path "/weathers/1"

    within ("heading") do
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
