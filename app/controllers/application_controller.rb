class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        p "reached after sign in"
        if resource.block_access.present?
          p "yes blocked user"
          redirect_to restrict_index_path
        else
          p "no, its enabled user"
          if resource.role_id == 1
            redirect_to employee_info_path
          else
            super
          end
        end
      end
end
