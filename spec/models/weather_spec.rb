require 'spec_helper'

  describe Weather do
    describe "validates" do
      it "validates presence of date" do
        station_invalid = Condition.create(max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of max temperature" do
        station_invalid = Condition.create(date:"11072016", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of mean temperature" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of min temperature" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of mean humidity" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of mean visibility" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_wind_speed:"25", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of mean wind speed" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", precipitation:"10")

        expect(station_invalid).to_not be_valid
      end
    end

     describe "validates" do
      it "validates presence of precipitation" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validates" do
      it "is valid with valid attributes" do
        station_invalid = Condition.create(date:"11072016", max_temperature:"90", mean_temperature:"50", min_temperature:"0", mean_humidity:"10", mean_visibility:"10", mean_wind_speed:"25", precipitation:"10")
      end
    end
  end
