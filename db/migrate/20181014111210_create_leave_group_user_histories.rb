class CreateLeaveGroupUserHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_group_user_histories do |t|
      t.references :leave_group_employee, foreign_key: true, index: true
      t.date :date_of_leave
      
      t.timestamps
    end
  end
end
