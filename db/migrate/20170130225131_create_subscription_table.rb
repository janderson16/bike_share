class CreateSubscriptionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_type

      t.timestamp null: false
    end
  end
end
