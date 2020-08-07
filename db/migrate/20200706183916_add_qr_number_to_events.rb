class AddQrNumberToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :QRnumber, :string
  end
end
