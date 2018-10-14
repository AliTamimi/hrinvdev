class LeaveTypesController < ApplicationController

    def index
        @leave_type = LeaveType.all
        
    end
    def new
        @leave_type = LeaveType.new
    end
    def create 
        @leave_type = LeaveType.new(leave_type_params)

        respond_to do |format|
            if @leave_type.save
                format.html { redirect_to leave_types_path, notice: 'Leave type was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def edit

    end
    def leave_type_params
        params.require(:leave_type).permit(:name, :detuct_from_annul, :weight, :max_days, :max_apply)
    end
end
