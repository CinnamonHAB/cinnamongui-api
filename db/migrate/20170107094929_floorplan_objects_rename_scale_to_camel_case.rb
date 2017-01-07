class FloorplanObjectsRenameScaleToCamelCase < ActiveRecord::Migration[5.0]
  def change
    rename_column :floorplan_objects, :scale_x, :scaleX
    rename_column :floorplan_objects, :scale_y, :scaleY
  end
end
