class AddMaxApplyToLeaveType < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_types, :max_apply, :integer, default: 1
  end
end
