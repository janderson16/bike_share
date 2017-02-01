require_relative '../../spec_helper'

  describe Condition do
    descrive "validates" do
      it "validates presence of date"
        station_invalid = Condition.create(max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of max temperature"
        station_invalid = Condition.create(date:"11072016", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of mean temperature"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of min temperature"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of mean humidity"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of mean visibility"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of mean wind speed"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     descrive "validates" do
      it "validates presence of precipitation"
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validates" do
      it "is valid with valid attributes" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

    