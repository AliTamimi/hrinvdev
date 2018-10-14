class CreateLeaveGroupEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_group_employees do |t|
      t.references :employee, foreign_key: true, index: true
      t.float :leave_count, default: 0
      t.references :leave_type, foreign_key: true, index: true
      t.float :current_month_leave, default: 0
      t.integer :current_month
      t.integer :carry_forward_leave, default: 0
      t.integer :carry_forward_year
      
      t.timestamps
    end
  end
end
