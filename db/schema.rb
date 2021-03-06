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

ActiveRecord::Schema.define(version: 20180507114249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "username",                         null: false
    t.string   "email",                            null: false
    t.string   "password_digest",                  null: false
    t.string   "session_token"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "motto"
    t.boolean  "receive_emails",  default: false
    t.integer  "current_points",  default: 0
    t.string   "access_type",     default: "user"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "temp_password"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
