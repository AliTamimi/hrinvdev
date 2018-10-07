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

ActiveRecord::Schema.define(version: 2018_10_07_101944) do

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

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "report_to"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "higher_level", default: false
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
