class UpdateAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :exitTime, :datetime
    add_column :attendances, :arrivalTime, :datetime
    add_column :attendances, :pointsEarned, :integer
    remove_column :attendances, :time, :integer
  end
end
