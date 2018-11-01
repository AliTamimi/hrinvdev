# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_16_162312) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_histories", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "department_id"
    t.integer "position_id"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employee_histories_on_department_id"
    t.index ["employee_id"], name: "index_employee_histories_on_employee_id"
    t.index ["position_id"], name: "index_employee_histories_on_position_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.date "dob"
    t.date "join_date"
    t.string "phone"
    t.integer "custom_report_to"
    t.integer "company_id"
    t.integer "department_id"
    t.integer "position_id"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "last_working_day"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["name"], name: "index_employees_on_name"
    t.index ["position_id"], name: "index_employees_on_position_id"
  end

  create_table "leave_emp_histories", force: :cascade do |t|
    t.integer "leave_group_employee_id"
    t.date "from_day"
    t.date "to_day"
    t.integer "leave_status"
    t.datetime "status_updated_at"
    t.integer "approved_by"
    t.integer "employee_id"
    t.integer "leave_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leave_emp_histories_on_employee_id"
    t.index ["leave_group_employee_id"], name: "index_leave_emp_histories_on_leave_group_employee_id"
    t.index ["leave_type_id"], name: "index_leave_emp_histories_on_leave_type_id"
  end

  create_table "leave_group_employee_histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_group_employees", force: :cascade do |t|
    t.integer "employee_id"
    t.float "leave_count", default: 0.0
    t.integer "leave_type_id"
    t.float "current_month_leave", default: 0.0
    t.integer "current_month"
    t.integer "carry_forward_leave", default: 0
    t.integer "carry_forward_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "applied_count", default: 0.0
    t.index ["employee_id"], name: "index_leave_group_employees_on_employee_id"
    t.index ["leave_type_id"], name: "index_leave_group_employees_on_leave_type_id"
  end

  create_table "leave_group_user_histories", force: :cascade do |t|
    t.integer "leave_group_employee_id"
    t.date "date_of_leave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_group_employee_id"], name: "index_leave_group_user_histories_on_leave_group_employee_id"
  end

  create_table "leave_groups", force: :cascade do |t|
    t.float "days", default: 0.0
    t.integer "leave_type_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_type_id"], name: "index_leave_groups_on_leave_type_id"
    t.index ["position_id"], name: "index_leave_groups_on_position_id"
  end

  create_table "leave_types", force: :cascade do |t|
    t.string "name"
    t.boolean "detuct_from_annul", default: true
    t.float "weight", default: 0.0
    t.float "max_days", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_apply", default: 1
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "report_to"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "higher_level", default: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.integer "module_id"
    t.boolean "view"
    t.boolean "view_all"
    t.boolean "create_edit"
    t.boolean "delete_access"
    t.boolean "approve"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "all_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "phone"
    t.integer "role_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.boolean "block_access", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
