class AddAccumulatedPointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :accumulated_athletics_points, :integer
    add_column :users, :accumulated_dining_points, :integer
  end
end
