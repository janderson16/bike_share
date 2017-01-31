require_relative '../spec_helper'

  RSpec.describe Station do
    describe "validations" do
      it "validates presence of name" do
        station_invalid = Station.create(dock_count: 1, city: "Denver", installation_date:"11072016")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of dock count" do
        station_invalid = Station.new(name: "Santiago" , city: "Denver", installation_date:"11072016")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of city" do
        station_invalid = Station.new(name: "Santiago", dock_count: 1, installation_date:"11072016")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence od installation date" do
        station_invalid = Station.new(name: "Santiago", dock_count: 1, city: "Denver")

        expect(station_invalid).to_not be_valid
      end
    end
end
