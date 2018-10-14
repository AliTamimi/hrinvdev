class CreateLeaveGroupEmployeeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_group_employee_histories do |t|
      
      t.timestamps
    end
  end
end
