class CompanyController < ApplicationController
    before_action :authenticate_user! 
    #before_action :verify_access
    before_action :set_company, only: [:toggle_active]
    before_action :validate_request, only: [:index, :new, :create,:edit, :update]


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
    def edit
        
    end
    def update
        respond_to do |format|
          if @company.update(company_params)
            format.html { redirect_to company_path, notice: 'Company was successfully updated.' }
            format.json { render :show, status: :ok, location: @company }
          else
            format.html { render :edit }
            format.json { render json: @company.errors, status: :unprocessable_entity }
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
    def validate_request
        if current_user.role.name != "Admin"
        access =  case params[:action]
        when "index"
            "view"
        when "create"
            "create_edit"
        when "edit","update"
            "create_edit"
        else
        ""
        end
        redirect_to restrict_index_path unless current_user.role.role_permissions.where(module_id: 0).first.present? && current_user.role.role_permissions.where(module_id: 0).first.send(access).present?
        end
    end

    private    
    def set_company
      @company = Company.find(params[:company_id])
    end

end
