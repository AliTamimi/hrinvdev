class Company < ApplicationRecord
    has_many :employees
    validates :name, presence: true

    #before_create :set_module_id
end
