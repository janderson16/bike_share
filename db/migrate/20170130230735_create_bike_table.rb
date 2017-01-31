class CreateBikeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :serial_no

      t.timestamp null: false
    end
  end
end
