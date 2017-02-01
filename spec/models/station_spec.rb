require 'spec_helper'

  describe Station do
    describe "validates" do
      it "validates presence of name" do
        City.create(name:"Denver")
        station_invalid = Station.create(dock_count: 1, city_id: "1", installation_date:"11072016")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validations" do
      it "validates presence of dock count" do
        City.create(name:"Denver")
        station_invalid = Station.new(name: "Santiago" , city_id: "2", installation_date:"11072016")

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
      it "validates presence of installation date" do
         City.create(name:"Denver")
        station_invalid = Station.new(name: "Santiago", dock_count: 1, city_id: "1")

        expect(station_invalid).to_not be_valid
      end
    end

    describe "validates" do
      it "is valid with valid attributes" do
        City.create(name:"Denver")
        station_valid = Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")

      expect(station_valid).to be_valid
      end
    end

    describe ".total_number_of_stations" do
    it "returns the total number of stations" do
       City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.total_number_of_stations).to eql(2)
    end
  end

  describe ".average_number_of_bikes_available_per_station" do
    it "returns the average number of stations" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 2, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 4, city_id: "1", installation_date:"10/07/1999")

      expect(Station.average_number_of_bikes_available_per_station).to eql(3)
    end
  end

  describe ".most_bikes_available_at_station" do
    it "returns the most bikes available at all stations" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.most_bikes_available_at_station).to eql(11)
    end
  end

  describe ".fewest_bikes_available_at_station" do
    it "returns the fewest bikes available at all stations" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.fewest_bikes_available_at_station).to eql(1)
    end
  end

  describe ".station_with_max_bikes" do
    it "returns the station(s) with most bikes" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.station_with_max_bikes).to eql(["Station1"])
    end
  end

  describe ".station_with_min_bikes" do
    it "returns the station(s) with least bikes" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1999")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.station_with_min_bikes).to eql(["Santiago"])
    end
  end

  describe ".oldest_station" do
    it "returns oldest station" do
      
      Station.create(name: "Santiago", dock_count: 1, city_id: 1, installation_date:"11/07/1991")
      Station.create(name: "Station1", dock_count: 11, city_id: 2, installation_date:"10/07/1999")

      expect(Station.oldest_station).to eql(["Santiago"])
    end
  end

  describe ".newest_station" do
    it "returns the station(s) with most bikes" do
      City.create(name:"Denver")
      Station.create(name: "Santiago", dock_count: 1, city_id: "1", installation_date:"11/07/1991")
      Station.create(name: "Station1", dock_count: 11, city_id: "1", installation_date:"10/07/1999")

      expect(Station.newest_station).to eql(["Station1"])
    end
  end
end
