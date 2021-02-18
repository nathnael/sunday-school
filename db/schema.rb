# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_17_233325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "email"
    t.string "postal_code"
    t.string "sub_city"
    t.string "woreda"
    t.string "house_no"
    t.string "home_phone"
    t.string "mobile_phone"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "relation"
    t.integer "address_id"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_number"
    t.datetime "date_received"
    t.datetime "invoice_date"
    t.integer "currency_type"
    t.integer "number_of_waybill"
    t.decimal "invoice_amount"
    t.text "remark"
    t.string "lti_number"
    t.integer "received_from"
    t.string "submitted_by"
    t.datetime "deleted_at"
    t.integer "created_by_id"
    t.integer "modified_by"
    t.integer "vendor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.integer "assigned_to_id"
  end

  create_table "member_departments", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "department_id", null: false
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_member_departments_on_department_id"
    t.index ["member_id"], name: "index_member_departments_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "name_am"
    t.string "father_name"
    t.string "father_name_am"
    t.string "grand_father_name"
    t.string "grand_father_name_am"
    t.string "gender"
    t.date "dob"
    t.string "educational_level"
    t.string "work"
    t.string "christian_name"
    t.string "christian_name_am"
    t.datetime "membership_date"
    t.text "talent"
    t.integer "home_address_id"
    t.integer "work_address_id"
    t.integer "emergency_contact_id"
    t.integer "status"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_picture_url"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_type"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "org_unit"
    t.string "status"
    t.datetime "deleted_at"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "member_departments", "departments"
  add_foreign_key "member_departments", "members"
end
