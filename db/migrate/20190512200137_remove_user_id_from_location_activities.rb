class RemoveUserIdFromLocationActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :location_activities, :user_id, :integer
  end
end
