class LeavesController < ApplicationController
    def index
        @leave_emp_history = LeaveEmpHistory.all
        
    end
    def new
        @leave_emp_history = LeaveEmpHistory.new
    end
    def create 
        @leave_emp_history = LeaveEmpHistory.new(leave_emp_history_params)

        respond_to do |format|
            if @leave_emp_history.save
                format.html { redirect_to leaves_path, notice: 'Leave was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def edit

    end
    def leave_emp_history_params
        params.require(:leave_emp_history).permit(:employee_id, :from_day, :to_day, :leave_status, :leave_type_id)
    end
end
