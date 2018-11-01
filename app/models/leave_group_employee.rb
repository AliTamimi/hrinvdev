class LeaveGroupEmployee < ApplicationRecord
    belongs_to :employee, optional: true 
    belongs_to :leave_type, optional: true 
    has_many :leave_emp_histories

    def detuct_from_annul_balance
	 gp_rec = LeaveGroup.where(position_id: self.employee.position.id).first
	         joining_date = self.employee.join_date
	         curr_date = Time.now
	         
	         working_mth = (curr_date.year * 12 + curr_date.month) - (joining_date.year * 12 + joining_date.month)
	         curr_mth = Time.now.month
	         curr_mth_working = (working_mth > 6) ? ((working_mth > curr_mth) ? curr_mth : working_mth) : 0
	         gp_rec.present? ? (gp_rec.days/12) * curr_mth_working : 0
	end
	def carry_leave
       if Time.now.year == self.carry_forward_year
         carry_leave = self.carry_forward_leave
       else
         carry_leave = 0
       end
	end
end
