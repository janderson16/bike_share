require 'spec_helper'

describe "when a user visits new weather conditions page" do
  it "they can create new weather conditions" do
    visit "/conditions/new"

    fill_in "weather[date]", :with => "2013-08-06"
    fill_in "weather[max_temp]", :with => "100"
    fill_in "weather[mean_temp]", :with => "50"
    fill_in "weather[min_temp]", :with => "0"
    fill_in "weather[mean_humidity]", :with => "50"
    fill_in "weather[mean_visibility_miles]", :with => "50"
    fill_in "weather[mean_wind_speed]", :with => "25"
    fill_in "weather[precipitation]", :with => "0"

    weather = Weather.create(date:"11072016", max_temp:"100", mean_temp:"50", min_temp:"0", mean_humidity:"50", mean_visibility_miles:"50", mean_wind_speed:"25", precipitation:"0")
    click_on("Add New Weather Condition")
    expect(current_path).to eql "/conditions/new"
  end
end
