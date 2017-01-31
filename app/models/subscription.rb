class Subscription < ActiveRecord::Base
  validates :kind, presence: true
  has_many :trips
end
