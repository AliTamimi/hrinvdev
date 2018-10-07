class Department < ApplicationRecord
    has_many :employees
    has_many :employee_histories
    validates :name, presence: true
end
