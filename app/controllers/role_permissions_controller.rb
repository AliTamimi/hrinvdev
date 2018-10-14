class RolePermissionsController < ApplicationController
    def index
        @role_permission = RolePermission.all
        
    end
    def new
        @role_permission = RolePermission.new
    end
    def create 
        @role_permission = RolePermission.new(role_permission_params)

        respond_to do |format|
            if @role_permission.save
                format.html { redirect_to role_permissions_path, notice: 'role permission was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def edit

    end
    def role_permission_params
        params.require(:role_permission).permit(:module_id, :view, :view_all, :create_edit, :delete_access, :approve, :role_id)
    end
end
