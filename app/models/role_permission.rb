class RolePermission < ApplicationRecord
    belongs_to :role, optional: true
    #before_save :set_module_id


    MODULE = ['module1', 'module2']

    #def set_module_id
    #    self.module_id = MODULE.index(self.module_id)
    #end

    def set_module_id
        p "=========="  
        self.module = MODULE.index(self.module)
    end
    def set_module_id
        p "=========="  
          p self.module_id
        p "========"
        self.module_id = MODULE.index(self.module_id)
    end
end
