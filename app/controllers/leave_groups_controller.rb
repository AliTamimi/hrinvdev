class LeaveGroupsController < ApplicationController
    def index
        @leave_group = LeaveGroup.all
        
    end
    def new
        @leave_group = LeaveGroup.new
    end
    def create 
        @leave_group = LeaveGroup.new(leave_group_params)

        respond_to do |format|
            if @leave_group.save
                format.html { redirect_to leave_groups_path, notice: 'Leave group was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def edit

    end
    def leave_group_params
        params.require(:leave_group).permit(:days, :leave_type_id, :position_id)
    end
end
