class Department < ApplicationRecord
    has_many :member_departments
    has_many :members, through: :member_departments
end
