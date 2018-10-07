class AddLastWorkingDayToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :last_working_day, :date
    
  end
end
