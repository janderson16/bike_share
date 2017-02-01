require 'spec_helper'

describe "when a user visits edit weather conditions page" do
  it "they can see" do
    Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

    visit "/conditions/1/edit"

    within ("#heading") do
      expect(page).to have_content "Weather Conditions"
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

  it "they can update information for weather conditions" do

    fill_in "condition[date]", :with => "2013-08-10"
    fill_in "condition[max_temperature]", :with => "10"
    fill_in "condition[mean_temperature]", :with => "15"
    fill_in "condition[min_temperature]", :with => "20"
    fill_in "condition[mean_humidity]", :with => "25"
    fill_in "condition[mean_visibility]", :with => "30"
    fill_in "condition[mean_wind_speed]", :with => "35"
    fill_in "condition[percipitation]", :with => "40"

    click_on("Update Weather Conditions")
    Condition.create(date:"2013-08-10", max_temperature:"10", mean_temperature:"15", min_temperature:"20", mean_humidity:"25", mean_visibility:"30", mean_wind_speed:"35", precipitation:"40")
    expect(page).to have_current_path "/conditions/1"

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
