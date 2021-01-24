class Invoice < ApplicationRecord
    belongs_to :vendor, foreign_key: 'vendor_id'
    belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by_id'
    belongs_to :assigned_to, :class_name => 'User', :foreign_key => 'assigned_to_id', optional: true

    enum currency_type: {
        ETB: 1,
        USD: 2
    }

    enum status: {
        Registered: 1,
        Assigned: 1,
        'In Process': 3,
        Processed: 2
    }

    enum received_from: {
        Transporter: 1,
        'Sub-office': 2,
        Others: 3
    }

    def vendor
        Vendor.find_by(id: self.vendor_id)
    end
end
