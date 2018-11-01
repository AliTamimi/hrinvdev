class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :employee, optional: true
  belongs_to :role , optional: true
  ROLES = ['admin','Gm','Hr', 'Employee']
end
