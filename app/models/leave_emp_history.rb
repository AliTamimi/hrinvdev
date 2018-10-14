class LeaveEmpHistory < ApplicationRecord
    belongs_to :leave_group_employee, optional: true 
    belongs_to :employee, optional: true 
    belongs_to :leave_type , optional: true 
    validates :from_day, :to_day, presence: true
    validate :verify_day
    before_save :set_leave_gp_employee
    validate :verify_leave_balance
    
    
    STATUS = ['apply', 'approved', 'rejected']

    
    def verify_day
        if self.from_day.present? && self.to_day.present?
        
        from_day_f = self.from_day.strftime("%Y-%m-%d")
        to_day_f = self.to_day.strftime("%Y-%m-%d")
            if from_day_f < Time.now
            errors.add(:from_day, "from date should be greater than today")
            elsif to_day_f < Time.now
            errors.add(:to_day, "to date should be greater than today")
            elsif to_day_f < from_day_f
            errors.add(:to_day, "to date should be greater than from date")
            end
        end
    end
    def set_leave_gp_employee
        rec = LeaveGroupEmployee.find_or_initialize_by(employee_id: self.employee_id, leave_type: self.leave_type)
        rec.update(leave_count: rec.leave_count + 1)
        self.leave_group_employee_id = rec.id
    end
    def verify_leave_balance
        if self.leave_taken_id.present? 
        rec = LeaveGroupEmployee.find_by(employee_id: self.employee_id, leave_type: self.leave_type)
        leave_taken = rec.present? ? rec.leave_count : 0
        if self.leave_taken.detuct_from_annul.blank?
          if (leave_taken + 1) > self.leave_type.max_days
            errors.add(:leave_type, "no  #{self.leave_type.name} leave exist")
          end
        else
          rec = self.leave_type.leave_group.where(position_id: self.employee.position_id).first
          max_days = rec.present? ? rec.days : 0
          if (leave_taken + 1) > max_days
            errors.add(:leave_type, "no #{self.leave_type.name} leave exist")
          end
          
        end
        end
    end
end
