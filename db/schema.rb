# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150512113136) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.date     "dob"
    t.string   "gender"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "enquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "location_users", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "location_users", ["location_id"], name: "index_location_users_on_location_id"
  add_index "location_users", ["user_id"], name: "index_location_users_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_tips", force: :cascade do |t|
    t.integer  "tip_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "complete"
  end

  add_index "plan_tips", ["plan_id"], name: "index_plan_tips_on_plan_id"
  add_index "plan_tips", ["tip_id"], name: "index_plan_tips_on_tip_id"

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.boolean  "completed"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "tips", force: :cascade do |t|
    t.string   "name"
    t.string   "tip_type"
    t.text     "description"
    t.string   "price"
    t.string   "initally_recommended_by"
    t.string   "best_for"
    t.string   "address"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "website"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.string   "state"
  end

  add_index "tips", ["location_id"], name: "index_tips_on_location_id"
  add_index "tips", ["user_id"], name: "index_tips_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
