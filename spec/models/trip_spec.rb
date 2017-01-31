require "spec_helper"

  RSpec.describe Trip do
    describe "validations" do
      it "validates presence of duration" do
        trip_invalid = Trip.create(start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of start_station" do
        trip_invalid = Trip.create(duration: "2 days", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of start_date" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of end_station" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of bike_id" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", subscription_type: "subscriber", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of subscription_type" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", zip_code: "12345")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of zip_code" do
        trip_invalid = Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber")

        expect(trip_invalid).to_not be_valid
      end
    end

    describe ".average_duration_of_ride" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.average_duration_of_ride).to eql(2)
    end
  end

  describe ".longest_ride" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/09/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.longest_ride).to eql(60)
    end
  end

  describe ".shortest_ride" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.shortest_ride).to eql(30)
    end
  end

  describe ".station_with_most_starting_rides" do
    it "" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station_name: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2014", end_station: "SF3", end_date: "12/12/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.station_with_most_starting_rides).to eql("SF2")
    end
  end

  describe ".station_with_most_ending_rides" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2014", end_station: "SF3", end_date: "12/12/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.station_with_most_ending_rides).to eql("SF3")
    end
  end

  describe ".rides_per_month" do
    it "returns the station(s) with least bikes" do
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/08/2014", end_station: "SF3", end_date: "12/10/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2014", end_station: "SF3", end_date: "12/12/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.rides_per_month).to eql(2)
    end
  end

  describe ".most_ridden_bike" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2014", end_station: "SF3", end_date: "12/12/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.most_ridden_bike).to eql("12345")
    end
  end

  describe ".least_ridden_bike" do
    it "" do
      Trip.create(duration: "30", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")
      Trip.create(duration: "60", start_station: "SF2", start_date: "12/10/2014", end_station: "SF3", end_date: "12/12/2014", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect(Trip.least_ridden_bike).to eql("12344")
    end
  end

  describe "." do
    it "" do
      Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "3 days", start_station: "SF2", start_date: "12/09/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect().to eql()
    end
  end

  describe ".date_with_most_trips" do
    it "" do
      Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "3 days", start_station: "SF2", start_date: "12/09/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect().to eql()
    end
  end

  describe ".date_with_least_trips" do
    it "" do
      Trip.create(duration: "2 days", start_station: "SF1", start_date: "12/10/2012", end_station: "SF2", end_date: "12/12/2012", bike_id: "12344", subscription_type: "subscriber", zip_code: "12345")
      Trip.create(duration: "3 days", start_station: "SF2", start_date: "12/09/2013", end_station: "SF3", end_date: "12/12/2013", bike_id: "12345", subscription_type: "customer", zip_code: "23456")

      expect().to eql()
    end
  end

end
