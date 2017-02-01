class Weather < ActiveRecord::Base
  has_one :trip
end
