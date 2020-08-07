class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :description
      t.integer :points
      t.string :category

      t.timestamps
    end
  end
end
