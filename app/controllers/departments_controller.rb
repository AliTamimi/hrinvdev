class DepartmentsController < ApplicationController
    before_action :authenticate_user! 
    before_action :verify_access

    def index
        @department = Department.all
    end
    def verify_access
        redirect_to restrict_index_path if User::ROLES[current_user.role_id] != 'admin'
    end
    def new 
        @department = Department.new
    end
    def create
        @department = Department.new(department_params)

        respond_to do |format|
            if @department.save
                format.html { redirect_to department_index_path, notice: 'Department was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def department_params
        params.require(:department).permit(:name, :active)
    end

end
