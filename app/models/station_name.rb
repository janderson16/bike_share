class StationName < ActiveRecord::Base
  validates :station_name, presence: true
  belongs_to :stations
end
