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

ActiveRecord::Schema.define(version: 20140525091406) do

  create_table "adminevents", force: true do |t|
    t.integer  "admin_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.integer  "user_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annoucements", force: true do |t|
    t.text     "contents"
    t.integer  "event_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "society_id"
    t.integer  "user_id"
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id"

  create_table "events", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "society_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "max_tickets"
    t.integer  "ticket_price"
    t.string   "location_address"
    t.integer  "post_code"
    t.integer  "tickets_remaining"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "picture1_file_name"
    t.string   "picture1_content_type"
    t.integer  "picture1_file_size"
    t.datetime "picture1_updated_at"
    t.string   "picture2_file_name"
    t.string   "picture2_content_type"
    t.integer  "picture2_file_size"
    t.datetime "picture2_updated_at"
    t.string   "picture3_file_name"
    t.string   "picture3_content_type"
    t.integer  "picture3_file_size"
    t.datetime "picture3_updated_at"
    t.integer  "reserve_amount"
  end

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "invitations", force: true do |t|
    t.integer  "society_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "joins", force: true do |t|
    t.integer  "user_id"
    t.integer  "society_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "name"
    t.integer  "user_id"
    t.text     "logo"
    t.string   "email_address"
    t.integer  "contact_number"
    t.integer  "validation_code"
    t.string   "image"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "societies_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "society_id", null: false
  end

  create_table "societyevents", force: true do |t|
    t.integer  "society_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societynetworks", force: true do |t|
    t.integer  "society_id"
    t.integer  "network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
