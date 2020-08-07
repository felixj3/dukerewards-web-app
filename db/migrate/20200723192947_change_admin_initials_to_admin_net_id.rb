class ChangeAdminInitialsToAdminNetId < ActiveRecord::Migration[6.0]
  def change
    rename_column :redemptions, :adminInitials, :adminNetID
  end
end
