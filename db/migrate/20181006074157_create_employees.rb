class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      execute('insert into sqlite_sequence(name,seq) values(\'employees\', 1000);')
      t.string :name, index: true
      t.string :nationality
      t.date :dob
      t.date :join_date
      t.string :phone
      t.integer :custom_report_to
      t.references :company, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true
      t.integer :created_by

      t.timestamps
    end
  end
end
