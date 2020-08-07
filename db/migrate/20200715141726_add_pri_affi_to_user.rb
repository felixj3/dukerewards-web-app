class AddPriAffiToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :primary_affiliation, :string
  end
end
