class EmployeeHistory < ApplicationRecord
    belongs_to :department, optional: true 
    belongs_to :position, optional: true 
    belongs_to :employee
end
