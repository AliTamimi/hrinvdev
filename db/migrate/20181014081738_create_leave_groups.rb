class CreateLeaveGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_groups do |t|
      t.float :days, default: 0
      t.references :leave_type, foreign_key: true, index: true
      t.references :position, foreign_key: true, index: true
      t.timestamps
    end
  end
end

