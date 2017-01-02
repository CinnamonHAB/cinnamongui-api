class CreatePredicateParams < ActiveRecord::Migration[5.0]
  def change
    create_table :predicate_params do |t|
      t.text :name
      t.text :param_type

      t.integer :predicate_id

      t.timestamps
    end
  end
end
