class LeaveType < ApplicationRecord
    has_many :leave_groups
    has_many :leave_group_employees
    has_many :leave_emp_histories
end
