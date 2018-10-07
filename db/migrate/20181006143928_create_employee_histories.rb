class CreateEmployeeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_histories do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true
      t.date :last_working_day
      t.integer :created_by
      
      t.timestamps
    end
  end
end
