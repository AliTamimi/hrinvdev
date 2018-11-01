class LeaveEmpHistory < ApplicationRecord
    belongs_to :leave_group_employee, optional: true 
    belongs_to :employee, optional: true 
    belongs_to :leave_type , optional: true 
    validates :from_day, :to_day, presence: true
    validate :verify_day
    before_create :set_leave_gp_employee
    validate :verify_leave_balance, on: :create
    before_update :update_leave_summary
    
    
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
    def calc_days
        from_day_f = Date.parse(self.from_day.strftime("%Y-%m-%d"))
        to_day_f = Date.parse(self.to_day.strftime("%Y-%m-%d"))
        (to_day_f - from_day_f).to_i
    end
    def set_leave_gp_employee
        rec = LeaveGroupEmployee.find_or_initialize_by(employee_id: self.employee_id, leave_type: self.leave_type)
        rec.update(applied_count: rec.applied_count + (self.leave_type.weight * (calc_days + 1)))
        self.leave_group_employee_id = rec.id
    end
    def verify_leave_balance #To verify leave balance
      

        if self.leave_type_id.present?
          requested_leave = calc_days + 1
          rec = LeaveGroupEmployee.find_by(employee_id: self.employee_id, leave_type: self.leave_type)
          if rec.present? && Time.now.year == rec.carry_forward_year
            carry_leave = rec.carry_forward_leave
          elsif rec.present?
            rec.update(carry_forward_year: Time.now.year, carry_forward_leave: 0)
            carry_leave = 0
          else
            carry_leave = 0
          end
          leave_taken = rec.present? ? (rec.leave_count + rec.applied_count) : 0
          if self.leave_type.detuct_from_annul.blank?
            if (leave_taken + (self.leave_type.weight * requested_leave)) > (self.leave_type.max_days + carry_leave)
              errors.add(:leave_type_id, "no #{self.leave_type.name} leave exist")
             end
          else
            gp_rec = LeaveGroup.where(position_id: self.employee.position.id).first
            joining_date = self.employee.join_date
            curr_date = Time.now
            
            working_mth = (curr_date.year * 12 + curr_date.month) - (joining_date.year * 12 + joining_date.month)
            curr_mth = Time.now.month
            curr_mth_working = (working_mth > 6) ? ((working_mth > curr_mth) ? curr_mth : working_mth) : 0
            gp_days = gp_rec.present? ? (gp_rec.days/12) * curr_mth_working : 0
            if (leave_taken + (self.leave_type.weight * requested_leave)) > (gp_days + carry_leave)
              errors.add(:leave_type_id, "no #{self.leave_type.name} leave exist")
             end
          end
         end
      end
   
    def update_leave_summary
     if leave_status_changed?
       if self.leave_status == 1#approved from applied
         rec = self.leave_group_employee
         self.leave_group_employee.update(leave_count: (rec.leave_count + 1), applied_count: (rec.applied_count - 1))
       elsif self.leave_status == 2 #rejected
         rec = self.leave_group_employee
         self.leave_group_employee.update(applied_count: (rec.applied_count - 1)) 
      end 
      end 
   end
   def carry_leave
    rec = self.leave_group_employee
    if rec.present? && Time.now.year == rec.carry_forward_year
      carry_leave = rec.carry_forward_leave
    else
      carry_leave = 0
    end
   end
   def detuct_from_annul_balance
    gp_rec = LeaveGroup.where(position_id: self.employee.position.id).first
            joining_date = self.employee.join_date
            curr_date = Time.now
            
            working_mth = (curr_date.year * 12 + curr_date.month) - (joining_date.year * 12 + joining_date.month)
            curr_mth = Time.now.month
            curr_mth_working = (working_mth > 6) ? ((working_mth > curr_mth) ? curr_mth : working_mth) : 0
            gp_rec.present? ? (gp_rec.days/12) * curr_mth_working : 0
   end
end
