class Department < ApplicationRecord
    belongs_to :member
    has_many :member_departments
    has_many :members, through: :member_departments
end
