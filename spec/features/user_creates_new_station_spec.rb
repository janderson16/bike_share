require_relative '../spec_helper'

  describe "when a user visits '/stations/index' " do
    it "they see a welcome message" do


        visit("/stations/index")
    fill_in "station[name]", :with => "Denver"
    #require 'pry'; binding.pry
    fill_in "station[city]", :with => "Denver"
    fill_in "station[dock_count]", :with => 111
    fill_in "station[installation_date]", :with => "11/07/1999"
    station = Station.new(name:"Denver", city:"Denver", dock_count:111, installation_date:"11/07/1999")


        within ("#greeting") do
          expect(page). to have_content("Stations in Greater San Francisco")
        end
    end


     it "they can click on a create station button" do
     visit "/"
    
     click_on "add Stations"
     expect(page).to have_current_path "/stations/new"
     end
    
     it "they can click view stations" do
     visit "/"
    
     click_on "View Stations"
     expect(page).to have_current_path "/stations/index"
   end
end

    expect(current_path).to eql "/stations/1"
    expect(page).to have_content "Denver"
    
  end
  end

