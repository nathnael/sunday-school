class VendorPolicy < ApplicationPolicy    
    
    def index?
       @current_user.permission('Vendor', :guest)
    end

end