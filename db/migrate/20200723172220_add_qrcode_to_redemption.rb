class AddQrcodeToRedemption < ActiveRecord::Migration[6.0]
  def change
    add_column :redemptions, :QRcode, :string
  end
end
