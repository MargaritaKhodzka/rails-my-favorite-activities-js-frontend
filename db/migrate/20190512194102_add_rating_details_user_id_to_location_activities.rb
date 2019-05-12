class AddRatingDetailsUserIdToLocationActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :location_activities, :rating, :integer
    add_column :location_activities, :details, :text
    add_column :location_activities, :user_id, :integer
  end
end
