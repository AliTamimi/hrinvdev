class LeaveGroupEmployee < ApplicationRecord
    belongs_to :employee, optional: true 
    belongs_to :leave_type, optional: true 
    has_many :leave_emp_histories
end
