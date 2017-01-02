class CreatePredicates < ActiveRecord::Migration[5.0]
  def change
    create_table :predicates do |t|
      t.text :keyword
      t.integer :domain_id

      t.timestamps
    end
  end
end
