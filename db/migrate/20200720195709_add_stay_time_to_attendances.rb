class AddStayTimeToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :stayTime, :integer
  end
end
