class CreateLinkDefinitionParams < ActiveRecord::Migration[5.0]
  def change
    create_table :link_definition_params do |t|
      t.integer :link_definition_id
      t.integer :predicate_param_id
      t.integer :device_definition_id

      t.timestamps
    end
  end
end
