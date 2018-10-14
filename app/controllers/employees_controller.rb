class EmployeesController < ApplicationController
    before_action :authenticate_user! 
    before_action :verify_user_access, except: [:employee_info]
    before_action :set_employee, only: [:new_access,:block_access,:allow_access, :edit, :update]
    
    def index
        @employee = Employee.all 
    end
    def new 
        @employee = Employee.new
    end
    def create
        @employee = Employee.new(employee_params)

        respond_to do |format|
            if @employee.save
                format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def new_access
        @user = @employee.build_user
    end
    def create_access
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to employees_path, notice: 'User was successfully created.' }
            else
                format.html { render :new_access }
            end 
        end
    end
    def edit
        
    end
    def update
        respond_to do |format|
          if @employee.update(employee_params)
            format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
            format.json { render :show, status: :ok, location: @employee }
          else
            format.html { render :edit }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
    end
    def block_access
        if  @employee.user.present?
            @employee.user.update(block_access: true)
        end
        redirect_to employees_path
    
    end
    def allow_access
        if  @employee.user.present?
            @employee.user.update(block_access: false)
        end
        redirect_to employees_path
    
    end
    def verify_user_access
        #restrict_index_path if User::ROLES.index("Employee") == current_user.role_id
        redirect_to restrict_index_path if User::ROLES.index("Employee") == current_user.role_id
    end
    
    def employee_info
        @employee = Employee.find_by(id: current_user.employee_id)
        redirect_to restrict_index_path if @employee.blank?
        
    end
    private
    def set_employee
        @employee = Employee.find(params[:id])
    end
    def employee_params
        params.require(:employee).permit(:name, :nationality, :dob, :join_date, :phone, :custom_report_to, :company_id, :department_id, :position_id)
    end
    def user_params
        params.require(:user).permit(:email, :password, :employee_id, :role_id)
    end

end
