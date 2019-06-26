class RemoveOccurenceFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :occurence, :string
  end
end
