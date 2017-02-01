require "spec_helper"

  RSpec.describe Trip do
    describe "validations" do
      it "validates presence of duration" do
        trip_invalid = Trip.create(start_station_id: 1, start_date: 12/10/2012, end_station_id: 2, end_date: 12/12/2012, bike_id: "12344", subscription_id: 2)

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of start_station" do
        trip_invalid = Trip.create(duration: 30, start_date: 12/10/2012, end_station_id: 2, end_date: 12/12/2012, bike_id: "12344", subscription_id: 2)

        expect(trip_invalid).to_not be_valid
      end
    end
  #
    describe "validations" do
      it "validates presence of start_date" do
        trip_invalid = Trip.create(start_station_id: 1, duration: 30, end_station_id: 2, end_date: 12/12/2012, bike_id: "12344", subscription_id: 2)

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of end_station" do
        trip_invalid = Trip.create(start_station_id: 1, duration: 30, start_date: 12/10/2012, end_date: 12/12/2012, bike_id: "12344", subscription_id: 2)

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of bike_id" do
        trip_invalid = Trip.create(start_station_id: 1, duration: 30, start_date: 12/10/2012, end_station_id: 2, end_date: 12/12/2012, subscription_id: 2)

        expect(trip_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of subscription_type" do
        trip_invalid = Trip.create(start_station_id: 1, duration: 30, start_date: 12/10/2012, end_station_id: 2, end_date: 12/12/2012, bike_id: "12344")

        expect(trip_invalid).to_not be_valid
      end
    end


    describe ".average_duration_of_ride" do
    it "measures average duration trip" do
      Trip.create(duration: 30, start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.average_duration_of_ride).to eql(50)
    end
  end

  describe ".longest_ride" do
    it "finds longest trip duration" do
      Trip.create(duration: 30, start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: 70, start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.longest_ride).to eql(70)
    end
  end

  describe ".shortest_ride" do
    it "finds shortest trip duration" do
      Trip.create(duration: 30, start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: 70, start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.shortest_ride).to eql(30)
    end
  end

  describe ".station_with_most_starting_rides" do
    it "finds station with the most trips originating there" do
      Station.create(name: "SF1", dock_count: 1, city_id: 1, installation_date:"11/07/1999")
      Station.create(name: "SF2", dock_count: 11, city_id: 1, installation_date:"10/07/1999")

      Trip.create(duration: 30, start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: 70, start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.station_with_most_starting_rides).to eql("SF2")
    end
  end

  describe ".station_with_most_ending_rides" do
    it "finds station with the most trips ending there" do
      Station.create(name: "SF1", dock_count: 1, city_id: 1, installation_date:"11/07/2004")
      Station.create(name: "SF2", dock_count: 11, city_id: 1, installation_date:"10/07/2003")
      Station.create(name: "SF3", dock_count: 11, city_id: 1, installation_date:"10/07/2000")

      Trip.create(duration: 30, start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: 60, start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: 70, start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.station_with_most_ending_rides).to eql("SF3")
    end
  end

  describe ".rides_per_month" do
    it "returns rides per month" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.rides_per_month).to eql(["Month: October, Count: 1", "Month: October, Count: 1", "Month: October, Count: 1"])
    end
  end

  describe ".rides_per_year" do
    it "returns rides per year" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/09/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.rides_per_month).to eql(["Month: October, Count: 1", "Month: September, Count: 1", "Month: October, Count: 1"])
    end
  end

  describe ".most_ridden_bike" do
    it "returns most ridden bike by bike id" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.most_ridden_bike).to eql("12344")
    end
  end

  describe ".least_ridden_bike" do
    it "returns least ridden bike by bike id" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.least_ridden_bike).to eql("12345")
    end
  end

  describe ".subscriber_count" do
    it "returns subscriber count" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.subscriber_count).to eql(2)
    end
  end

  describe ".customer_count" do
    it "returns customer count" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.customer_count).to eql(1)
    end
  end

  describe ".subscriber_breakout" do
    it "returns subscriber breakout" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.subscriber_breakout).to eql("66%")
    end
  end

  describe ".most_common_date" do
    it "returns date with highest number of trips" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/09/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.most_common_date).to eql("November 12, 2012")
    end
  end

  describe ".most_common_date_count" do
    it "returns the highest number of trips on a single date" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/09/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.most_common_date_count).to eql(3)
    end
  end

  describe ".date_with_least_trips" do
    it "returns date with least number of trips" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2013", end_station_id: 3, end_date: "12/12/2013", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2014", end_station_id: 3, end_date: "12/12/2014", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.least_common_date).to eql("October 12, 2012")
    end
  end

  describe ".least_common_date_count" do
    it "returns the lowest number of trips on a single date" do
      Trip.create(duration: "30", start_station_id: 1, start_date: "12/10/2012", end_station_id: 2, end_date: "12/12/2012", bike_id: "12344", subscription_id: 2, zip_code: "12345")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/10/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/11/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")
      Trip.create(duration: "60", start_station_id: 2, start_date: "12/09/2012", end_station_id: 3, end_date: "12/12/2012", bike_id: "12345", subscription_id: 1, zip_code: "23456")

      expect(Trip.least_common_date_count).to eql(1)
    end
  end

end
