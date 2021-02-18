class CreateMemberDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :member_departments do |t|
      t.references :member, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.integer :created_by
      t.integer :modified_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
