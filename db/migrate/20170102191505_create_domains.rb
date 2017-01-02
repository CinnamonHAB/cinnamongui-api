class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.text :name
      t.integer :floorplan_id

      t.timestamps
    end
  end
end
