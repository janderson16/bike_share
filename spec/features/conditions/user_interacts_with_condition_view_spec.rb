require 'spec_helper'

describe "when user views individual weather condition" do
  it "they can see that weather condition" do
    Weather.create(date:"11072016", max_temp:"100", mean_temp:"90", min_temp:"80", mean_humidity:"70", mean_visibility_miles:"60", mean_wind_speed:"50", precipitation:"40")
    visit "/conditions/1"

    within ("#greeting") do
      expect(page).to have_content("Condition")
    end

    within ("#table1") do
      expect(page).to have_content "100"
      expect(page).to have_content "90"
      expect(page).to have_content "70"
      expect(page).to have_content "60"
      expect(page).to have_content "50"
      expect(page).to have_content "40"
    end
end

describe "when user views individual condition" do
  it "they can click on edit button" do
Weather.create(date:"11072016", max_temp:"100", mean_temp:"90", min_temp:"80", mean_humidity:"70", mean_visibility_miles:"60", mean_wind_speed:"50", precipitation:"40")

    visit "/conditions/1"
    click_on "Edit Weather Condition"
      expect(current_path).to eql "/conditions/1"
    end
  end
end
