class RemoveOccurrenceDetailsTimeRatingFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :occurrence, :string
    remove_column :activities, :details, :text
    remove_column :activities, :time, :datetime
    remove_column :activities, :rating, :integer
  end
end
