class CompanyController < ApplicationController
    before_action :authenticate_user! 
    before_action :verify_access
    before_action :set_company, only: [:toggle_active]

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
        @company = Company.new(company_params)

        respond_to do |format|
            if @company.save
                format.html { redirect_to company_index_path, notice: 'Company was successfully created.' }
            else
                format.html { render :new }
            end 
        end
    end

    def company_params
        params.require(:company).permit(:name, :code, :active)
    end

    def toggle_active
        if params["status"] == "true"
        @company.update(active: true)
        else
        @company.update(active: false)
        end
    end

    private    
    def set_company
      @company = Company.find(params[:company_id])
    end

end
