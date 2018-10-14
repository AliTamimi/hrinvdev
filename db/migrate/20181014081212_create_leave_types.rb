class CreateLeaveTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_types do |t|
      t.string :name
      t.boolean :detuct_from_annul, default: true
      t.float :weight, default: 0
      t.float :max_days, default: 0
      t.timestamps
    end
  end
end
