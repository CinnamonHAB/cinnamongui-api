class AddDeviceDefinitionIdToFloorplanObjects < ActiveRecord::Migration[5.0]
  def change
    add_column :floorplan_objects, :device_definition_id, :integer
  end
end
