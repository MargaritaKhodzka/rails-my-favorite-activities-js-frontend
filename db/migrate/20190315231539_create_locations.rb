class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :neighborhood
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :user_id

      t.timestamps
    end
  end
end
