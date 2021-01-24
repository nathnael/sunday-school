class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.datetime :date_received
      t.datetime :invoice_date
      t.integer :currency_type
      t.integer :number_of_waybill
      t.decimal :invoice_amount
      t.text :remark
      t.string :lti_number
      t.integer :received_from
      t.string :submitted_by
      t.datetime :deleted_at
      t.integer :created_by
      t.integer :modified_by
      t.integer :vendor_id

      t.timestamps
    end
  end
end
