class Position < ApplicationRecord
    has_many :repotees, class_name: "Position", :foreign_key => 'report_to'
    belongs_to :repoter, class_name: "Position", :foreign_key => 'report_to', optional: true

    has_many :employees
    has_many :custom_repotees, class_name: "Employee", :foreign_key => 'custom_report_to'
    has_many :employee_histories
    has_many :leave_groups
    
end
