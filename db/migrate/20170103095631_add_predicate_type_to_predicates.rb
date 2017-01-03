class AddPredicateTypeToPredicates < ActiveRecord::Migration[5.0]
  def up
    execute "CREATE TYPE enum_predicate_type AS ENUM ('device', 'link', 'other');"
    add_column :predicates, :predicate_type, :enum_predicate_type, null: false, default: 'other'
  end

  def down
    remove_column :predicates, :predicate_type
    execute "DROP TYPE IF EXISTS enum_predicate_type"
  end
end
