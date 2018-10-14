class CreateRolePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :role_permissions do |t|
      t.integer :module_id
      t.boolean :view
      t.boolean :view_all
      t.boolean :create_edit
      t.boolean :delete_access 
      t.boolean :approve
      t.references :role, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
