class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :description
      t.integer :points
      t.string :category
      t.datetime :expiry_time
      t.integer :expiry_quantity
      t.boolean :status

      t.timestamps
    end
  end
end
