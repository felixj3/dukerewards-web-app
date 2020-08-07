class AddEmailToRewards < ActiveRecord::Migration[6.0]
  def change
    add_column :rewards, :email, :string
  end
end
