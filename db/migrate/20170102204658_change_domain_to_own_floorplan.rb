class ChangeDomainToOwnFloorplan < ActiveRecord::Migration[5.0]
  def change
    remove_column :domains, :floorplan_id
    change_table :floorplans do |t|
      t.integer :domain_id
    end
  end
end
