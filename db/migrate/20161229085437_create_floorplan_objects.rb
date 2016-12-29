class CreateFloorplanObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplan_objects do |t|
      t.float :angle
      t.text :background_color
      t.text :fill
      t.float :height
      t.float :width
      t.float :left
      t.float :top
      t.float :opacity
      t.float :scale_x
      t.float :scale_y

      t.timestamps
    end
  end
end
