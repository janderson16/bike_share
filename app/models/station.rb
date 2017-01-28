class Station < ActiveRecord::Base
  validates :name, :city, :installation_date, :dock_count, presence: true

end
