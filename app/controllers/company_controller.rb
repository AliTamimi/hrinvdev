class CompanyController < ApplicationController
    before_action :authenticate_user! 
    before_action :verify_access

    def index
        @company = Company.all
    end

    def verify_access
        redirect_to restrict_index_path if User::ROLES[current_user.role_id] != 'admin'
    end

    def new 
        @company = Company.new
    end

    def create 

    end

end
