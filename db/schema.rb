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

ActiveRecord::Schema.define(version: 20171017085921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.index ["photos_id"], name: "index_comments_on_photos_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "photos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
    t.index ["photos_id"], name: "index_likes_on_photos_id"
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "caption"
    t.string "photo_url"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "boost"
  end

  add_foreign_key "authentications", "users"
end
