class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :profile_pic
      t.integer :accumulated_total_points
      t.integer :athletics_points
      t.integer :dining_points
      t.string :netid
      t.string :email

      t.timestamps
    end
  end
end
