class RolesController < ApplicationController
    def index
        @role = Role.all
    end
    def new
        @role = Role.new
    end
    def create 
        @role = Role.new(role_params)

        respond_to do |format|
            if @role.save
                format.html { redirect_to roles_path, notice: 'Role was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def edit

    end
    def role_params
        params.require(:role).permit(:name)
    end
    
end
