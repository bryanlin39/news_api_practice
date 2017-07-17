class ChangeCoordinates < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :coordinates
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float    
  end
end
