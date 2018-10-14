class LeaveGroup < ApplicationRecord
    belongs_to :position, optional: true 
    belongs_to :leave_type, optional: true 
end
