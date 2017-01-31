class Subscription < ActiveRecord::Base
  validates :subscription_type, presence: true
  belongs_to :trip
end
