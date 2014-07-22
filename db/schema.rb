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

ActiveRecord::Schema.define(version: 20140722164156) do

  create_table "tracks", force: true do |t|
    t.string   "title",        default: "", null: false
    t.string   "name",         default: "", null: false
    t.integer  "score",        default: 0,  null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_score"
    t.integer  "hit_target",   default: 0,  null: false
    t.integer  "first_score",  default: 0,  null: false
    t.string   "permalink",    default: "", null: false
  end

  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",                default: "",    null: false
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.string   "token",               default: "",    null: false
    t.string   "refresh_token",       default: "",    null: false
    t.datetime "token_signed_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "tracks_count",        default: 0,     null: false
    t.boolean  "notify_me",           default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
