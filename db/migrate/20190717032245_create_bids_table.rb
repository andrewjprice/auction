class CreateBidsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string :name
      t.float :start_bid
      t.float :max_bid
      t.integer :auto_increment
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
