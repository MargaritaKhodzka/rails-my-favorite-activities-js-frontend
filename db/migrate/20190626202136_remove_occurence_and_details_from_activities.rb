class RemoveOccurenceAndDetailsFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :occurrence, :string
    remove_column :activities, :details, :text
  end
end
