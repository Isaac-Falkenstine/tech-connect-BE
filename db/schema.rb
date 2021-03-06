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

ActiveRecord::Schema.define(version: 2019_02_13_181758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "employers", force: :cascade do |t|
    t.citext "name"
    t.string "site_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.citext "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "status"
    t.datetime "meeting_date"
    t.string "meeting_location"
    t.string "token"
    t.bigint "user_id"
    t.integer "connection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.citext "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.citext "name"
    t.string "password_digest"
    t.string "email"
    t.bigint "phone_number"
    t.string "github"
    t.string "linkedin"
    t.string "bio"
    t.string "api_key"
    t.string "photo"
    t.bigint "location_id"
    t.bigint "employer_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_users_on_employer_id"
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["position_id"], name: "index_users_on_position_id"
  end

  add_foreign_key "messages", "users"
  add_foreign_key "users", "employers"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "positions"
end
