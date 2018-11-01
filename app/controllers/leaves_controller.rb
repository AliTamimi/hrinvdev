class LeavesController < ApplicationController
    before_action :set_leave_history, only: [:approve, :reject]

    def index
        @leave_emp_history = LeaveEmpHistory.all
        @applied_leaves = LeaveEmpHistory.where(leave_status: 0)
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
    def approve
        @leave_emp_history.update(leave_status: 1)
        redirect_to leaves_path
    end
    def reject
        @leave_emp_history.update(leave_status: 2)
        redirect_to leaves_path
    end
    def leave_emp_history_params
        params.require(:leave_emp_history).permit(:employee_id, :from_day, :to_day, :leave_status, :leave_type_id)
    end
    private
    def set_leave_history
        @leave_emp_history = LeaveEmpHistory.find(params[:id])
    end
end
