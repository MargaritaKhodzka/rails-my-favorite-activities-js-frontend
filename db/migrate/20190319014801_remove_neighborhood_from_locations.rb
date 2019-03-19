class RemoveNeighborhoodFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :neighborhood, :string
  end
end
