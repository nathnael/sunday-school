class AddAssignedToColumnToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :assigned_to, :integer
  end
end
