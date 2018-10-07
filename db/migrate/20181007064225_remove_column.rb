class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :employee_histories, :last_working_day
  end
end
