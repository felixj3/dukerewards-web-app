class AddRadiusToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :radius, :string
  end
end
