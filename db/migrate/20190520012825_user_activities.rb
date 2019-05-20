class UserActivities < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_activities
  end
end
