class AddEmployeeToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :employee, index:true
  end
end
