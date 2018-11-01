class AddAppliedCountToLeaveGroupEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_group_employees, :applied_count, :float, default: 0
  end
end
