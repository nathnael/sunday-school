class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :name_am
      t.string :father_name
      t.string :father_name_am
      t.string :grand_father_name
      t.string :grand_father_name_am
      t.string :gender
      t.date :dob
      t.string :educational_level
      t.string :work
      t.string :christian_name
      t.string :christian_name_am
      t.datetime :membership_date
      t.text :talent
      t.integer :home_address_id
      t.integer :work_address_id
      t.integer :emergency_contact_id
      t.integer :status
      t.integer :created_by
      t.integer :modified_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
