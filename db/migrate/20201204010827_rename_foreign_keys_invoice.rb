class RenameForeignKeysInvoice < ActiveRecord::Migration[6.0]
  def change
    rename_column :invoices, :created_by, :created_by_id
    rename_column :invoices, :assigned_to, :assigned_to_id
  end
end
