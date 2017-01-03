class CreateDeviceDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :device_definitions do |t|
      t.integer :problem_id
      t.integer :predicate_id
      t.text :name

      t.timestamps
    end
  end
end
