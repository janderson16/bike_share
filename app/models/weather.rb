class Weather < ActiveRecord::Base
  has_many :trips
end
