class DepartmentPolicy < ApplicationPolicy    
    
    def index?
       @current_user.permission('Department', :guest)
    end

end