class Permission < ApplicationRecord
    has_many :user_permission
    has_many :users, through: :user_permission

    validates :name, presence: true

    enum user_types: [:guest, :clerk, :manager, :admin]
end
