class UpdateEventModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :name
    remove_column :events, :start_time
    remove_column :events, :end_time
    remove_column :events, :location
    remove_column :events, :description
    remove_column :events, :category
    remove_column :events, :image
    add_column :events, :eventid, :string
  end
end
