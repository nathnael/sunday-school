class CreateEmergencyContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :full_name
      t.string :relation
      t.integer :address_id
      t.integer :created_by
      t.integer :modified_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
