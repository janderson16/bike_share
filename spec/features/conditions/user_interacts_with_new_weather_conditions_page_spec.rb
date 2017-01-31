require_relative '../../spec_helper'

describe "when a user visits new weather conditions page" do
  it "they can create new weather conditions" do
    visit "/conditions/new"

    fill_in "condition[date]", :with => "2013-08-06"
    fill_in "condition[max_temperature]", :with => "100"
    fill_in "condition[mean_temperature]", :with => "50"
    fill_in "condition[min_temperature]", :with => "0"
    fill_in "condition[mean_humidity]", :with => "50"
    fill_in "condition[mean_visibility]", :with => "50"
    fill_in "condition[mean_wind_speed]", :with => "25"
    fill_in "condition[precipitaiton]", :with => "0"

    condition = Condition.create(date:"11072016", max_temperature:"100", mean_temperature:"50", min_temperature:"0", mean_humidity:"50", mean_visibility:"50", mean_wind_speed:"25", precipitation:"0")
    expect(current_path).to eql "/conditions/1"

    within ("#heading") do
    expect(page).to have_content "2013-08-06"
    end
    within ("#table1") do
    expect(page).to have_content "100"
    expect(page).to have_content "50"
    expect(page).to have_content "0"
    expect(page).to have_content "50"
    expect(page).to have_content "50"
    expect(page).to have_content "25"
    expect(page).to have_content "0"
    end
  end
end

