class AddStatusColumnToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :status, :integer
  end
end
