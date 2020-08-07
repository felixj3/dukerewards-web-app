class RemoveStatusFromRewards < ActiveRecord::Migration[6.0]
  def change
    remove_column :rewards, :status, :boolean
  end
end
