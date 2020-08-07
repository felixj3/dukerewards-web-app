class AddAdminToRedemptions < ActiveRecord::Migration[6.0]
  def change
    add_column :redemptions, :dateHandled, :datetime
    add_column :redemptions, :adminInitials, :string
  end
end
