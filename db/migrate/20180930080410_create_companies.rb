class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name 
      t.string :code
      t.boolean :active 
      t.timestamps
    end
  end
end
