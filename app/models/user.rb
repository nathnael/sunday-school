class User < ApplicationRecord
  
   has_many :user_permissions
   has_many :permissions, through: :user_permissions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 
   enum user_types: {
     guest:0,    
     clerk:1,
     manager:2,
     admin:3
   }
  
  def name
    name.to_s + ' ' + father_name.to_s + grand_father_name.to_s
  end

  def name_am
    name_am.to_s + ' ' + father_name_am.to_s + grand_father_name_am.to_s
  end

  def permission(permission, user_type)   
    return  self.permissions.where(name: permission, user_type: User.user_types[user_type]).count > 0 ? true : false
  end

  def has_permission(permission_id)
     self.permissions.where(id: permission_id).count > 0 ? true : false     
  end

  def user_type_in(users_types)
    users_types.include?(self.user_types)
  end
      
end
