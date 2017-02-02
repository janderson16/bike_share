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

    click_on("Add New Weather Condition") do
    expect(current_path).to eql "/conditions/1"
    expect(page).to have_content('2013-08-06')
    expect(page).to have_content('100')
    expect(page).to have_content('50')
    expect(page).to have_content('50')
    expect(page).to have_content('25')
    expect(page).to have_content('0')
  end
  end
end
