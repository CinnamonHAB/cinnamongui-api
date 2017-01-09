class CreateLinkDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :link_definitions do |t|
      t.integer :problem_id
      t.integer :predicate_id

      t.timestamps
    end
  end
end
