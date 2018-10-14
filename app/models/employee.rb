class Employee < ApplicationRecord

    belongs_to :company, optional: true 
    belongs_to :department, optional: true 
    belongs_to :position, optional: true  
    belongs_to :custom_repoter, class_name: "Position", :foreign_key => 'custom_report_to', optional: true
    has_one :user
    has_many :employee_histories
    has_many :leave_group_employees
    has_many :leave_emp_histories
    before_update :create_history

    def create_history
        if self.position_id_changed? || self.department_id_changed?
          EmployeeHistory.create(position_id: self.position_id_was, department_id: self.department_id_was, employee_id: self.id)
        end 
    end
end
