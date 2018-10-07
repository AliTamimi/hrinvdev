class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name 
      t.string :code 
      t.integer :report_to
      t.boolean :active
      
      t.timestamps
    end
  end
end
