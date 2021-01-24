class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :code
      t.string :org_unit
      t.string :status
      t.datetime :deleted_at
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
