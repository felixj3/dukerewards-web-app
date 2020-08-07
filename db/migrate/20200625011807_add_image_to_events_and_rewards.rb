class AddImageToEventsAndRewards < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image, :string
    add_column :rewards, :image, :string
  end
end
