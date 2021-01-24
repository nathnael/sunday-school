class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :email
      t.string :postal_code
      t.string :sub_city
      t.string :woreda
      t.string :house_no
      t.string :home_phone
      t.string :mobile_phone
      t.integer :created_by
      t.integer :modified_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
