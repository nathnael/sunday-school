class Member < ApplicationRecord
    has_many :departments
    has_many :home_address, :class_name => 'Address', :foreign_key => 'home_address_id'
    has_many :work_address, :class_name => 'Address', :foreign_key => 'work_address_id'
    has_many :emergency_contact
end
