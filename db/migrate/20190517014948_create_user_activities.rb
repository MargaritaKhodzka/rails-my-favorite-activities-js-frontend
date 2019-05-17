class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities do |t|
      t.integer :activity_id
      t.integer :location_id
      t.integer :rating
      t.text :details

      t.timestamps
    end
  end
end
