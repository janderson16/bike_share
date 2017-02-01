require "spec_helper"

  RSpec.describe Trip do
    describe "validations" do
      it "validates presence of duration" do
        trip_invalid = Trip.create(start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_id: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of start_station" do
        trip_invalid = Trip.create(duration: "2 days", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_id: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of start_date" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_id: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of end_station" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_date: "12/12/2012", bike_id: "12344", subscription_id: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of bike_id" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", subscription_id: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of subscription_id" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of zip_code" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_id: "subscriber")

        expect(trip_invalid).to_not be_valid
      end
    end

  end
