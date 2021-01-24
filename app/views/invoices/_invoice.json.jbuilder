json.extract! invoice, :id, :invoice_number, :date_received, :invoice_date, :currency_type, :number_of_waybill, :invoice_amount, :remark, :lti_number, :received_from, :submitted_by, :deleted_at, :created_by, :modified_by, :vendor_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
