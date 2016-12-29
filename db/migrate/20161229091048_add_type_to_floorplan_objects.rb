class AddTypeToFloorplanObjects < ActiveRecord::Migration[5.0]
  def change
    add_column :floorplan_objects, :type, :text
  end
end
