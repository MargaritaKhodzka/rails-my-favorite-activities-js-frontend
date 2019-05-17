class DropLocationActivities < ActiveRecord::Migration[5.2]
  def change
    drop_table :location_activities
  end
end
