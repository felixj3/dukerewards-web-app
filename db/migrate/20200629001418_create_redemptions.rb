class CreateRedemptions < ActiveRecord::Migration[6.0]
  def change
    create_table :redemptions do |t|
      t.belongs_to :reward
      t.belongs_to :user
      t.timestamps
    end
  end
end
