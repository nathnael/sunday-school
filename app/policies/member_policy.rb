class MemberPolicy < ApplicationPolicy    
    
    def index?
       @current_user.permission('Member', :guest)
    end

end