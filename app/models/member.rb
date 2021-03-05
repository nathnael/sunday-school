class Member < ApplicationRecord
    has_one :home_address, :class_name => 'Address', :foreign_key => 'home_address_id'
    has_one :work_address, :class_name => 'Address', :foreign_key => 'work_address_id'
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

    def gender_am
        if gender == 'female'
            "ሴት"
        else
            "ወንድ"
        end
    end

    # @departments = MemberDepartment.where(member_id: @member.id).joins(:department).map { |d| d.department.name }.join(', ')
    def departments_am
        @departments = MemberDepartment.where(member_id: id).joins(:department).map { |d| d.department.name }
        @all_departments = Department.all.map { |d| d.name }
        # ["Arts Department", "Education Department", "Songs Department", "Finance Department", "Discipline Department", "Development Department", "Public Relations Department", "Kids Department", "Audit and Inspection Department", "Property and Procurement Department"]
        @departments_am = ""
        @all_departments.each do |d|
            if @departments.include?(d)
                @departments_am += (translate_department_am(d.strip) + " [X]  ")
            else
                @departments_am += (translate_department_am(d.strip) + " [ ]  ")
            end
        end
        return @departments_am
    end

    def translate_department_am (department)
        case department
        when "Arts Department"
          "ኪነ-ጥበብ ክፍል" 
        when "Education Department"
          "ትምህርት ክፍል"
        when "Songs Department"
          "መዝሙር ክፍል" 
        when "Finance Department"
          "ሒሳብ ክፍል"
        when "Discipline Department"
          "ሥነ-ስርዓት ክፍል" 
        when "Development Department"
          "ልማት ክፍል"
        when "Public Relations Department"
          "ግንኙነት ክፍል" 
        when "Kids Department"
          "ሕጻናት ክፍል"
        when "Audit and Inspection Department"
          "ኦዲትና ኢንስፔክሽን ክፍል" 
        when "Property and Procurement Department"
          "ንብረትና ግዥ ክፍል"
        else
          department
        end
    end
end
