require 'spec_helper'

describe "when user views individual weather condition" do
  it "they can delete that weather condition" do
    Condition.create(date:"11072016", max_temperature:"100", mean_temperature:"90", min_temperature:"80", mean_humidity:"70", mean_visibility:"60", mean_wind_speed:"50", precipitation:"40")
    visit "/stations/#{condition.id}"

    within ("heading") do
      expect(page).to have_content("11072016")
    end

    within ("#table1") do
      expect(page).to have_content "100"
      expect(page).to have_content "90"
      expect(page).to have_content "80"
      expect(page).to have_content "70"
      expect(page).to have_content "60"
      expect(page).to have_content "50"
      expect(page).to have_content "40"
    end

  it "they can click on delete button" do
    click_on "Delete Weather Condition"
      expect(current_path).to eql "/conditions/index"
    end
  end
end
