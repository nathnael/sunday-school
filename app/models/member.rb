class Member < ApplicationRecord
    has_one :home_address, :class_name => 'Address', :foreign_key => 'home_address_id'
    has_many :work_address, :class_name => 'Address', :foreign_key => 'work_address_id'
    has_many :emergency_contact
    has_many :member_departments
    has_many :departments, through: :member_departments

    enum status: {
        Active: 1,
        Inactive: 2,
        Suspended: 3
    }
    def full_name
        name.to_s + ' ' + father_name.to_s + ' ' + grand_father_name.to_s
    end

    def full_name_am
        name_am.to_s + ' ' + father_name_am.to_s + ' ' + grand_father_name_am.to_s
    end
end
