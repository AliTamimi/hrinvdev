class CreateLeaveEmpHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_emp_histories do |t|
      t.references :leave_group_employee, foreign_key: true, index: true
      t.date :from_day
      t.date :to_day
      t.integer :leave_status
      t.datetime :status_updated_at
      t.integer :approved_by
      t.references :employee
      t.references :leave_type

      t.timestamps
    end
  end
end
