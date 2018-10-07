class PositionController < ApplicationController
    before_action :authenticate_user! 
    before_action :verify_access

    def index
        @position = Position.all
    end
    def verify_access
        redirect_to restrict_index_path if User::ROLES[current_user.role_id] != 'admin'
    end
    def new 
        @position = Position.new
    end

    def create 
        @position = Position.new(position_params)

        respond_to do |format|
            if @position.save
                format.html { redirect_to position_index_path, notice: 'Position was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end
    def position_params
        params.require(:position).permit(:name, :code, :report_to, :active)
    end
end
